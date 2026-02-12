STOW_DIR := $(shell pwd)
TARGET   := $(HOME)
STOW     := stow --no-folding --target=$(TARGET) --dir=$(STOW_DIR)

# Auto-detect packages (any directory except .git)
PACKAGES := $(shell find . -maxdepth 1 -mindepth 1 -type d \
            ! -name '.git' -printf '%f\n' | sort)

.PHONY: help stow unstow restow list dry-run clean

help:
	@echo "Usage:"
	@echo "  make stow          Stow all packages"
	@echo "  make unstow        Unstow all packages"
	@echo "  make restow        Restow all (refresh symlinks)"
	@echo "  make stow-PKG      Stow a single package"
	@echo "  make unstow-PKG    Unstow a single package"
	@echo "  make dry-run       Preview changes"
	@echo "  make list          List packages"
	@echo "  make clean         Remove broken symlinks"
	@echo ""
	@echo "Packages: $(PACKAGES)"

stow:
	@$(foreach pkg,$(PACKAGES),echo "[+] $(pkg)"; $(STOW) $(pkg);)

unstow:
	@$(foreach pkg,$(PACKAGES),echo "[-] $(pkg)"; $(STOW) -D $(pkg);)

restow:
	@$(foreach pkg,$(PACKAGES),echo "[~] $(pkg)"; $(STOW) -R $(pkg);)

stow-%:
	$(STOW) $*

unstow-%:
	$(STOW) -D $*

restow-%:
	$(STOW) -R $*

dry-run:
	@$(foreach pkg,$(PACKAGES),echo "=== $(pkg) ==="; $(STOW) -n -v $(pkg) 2>&1;)

list:
	@$(foreach pkg,$(PACKAGES),echo "  $(pkg)";)

clean:
	@find $(TARGET) -maxdepth 4 -xtype l -print -delete 2>/dev/null || true
