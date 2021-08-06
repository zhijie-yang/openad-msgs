SHELL := /bin/bash
DEB_VER := 0.$$(date '+%y%m%d.%H%M')+$$(git rev-parse --short HEAD)
CLEAN_VER := $$([[ -z $$(git status -s) ]] || echo '.dirty')

all:
	@mkdir -p build
	@echo ""
	@echo "###################################################"
	@echo "# CMake"
	@echo "###################################################"
	@echo ""
	@cd build && cmake ..
	@echo ""
	@echo "###################################################"
	@echo "# Build"
	@echo "###################################################"
	@echo ""
	@cd build && make --no-print-directory -j4

clean:
	@rm -r build

run_viewer:
	@source build/devel/setup.bash && rosrun rqt_msg rqt_msg

install_deps:
	@echo "###################################################"
	@echo "# Install Dependencies"
	@echo "###################################################"
	@echo "no deps needed"

deb:
	@mkdir -p build
	@cd build; \
	cmake .. \
		-DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX="/opt/ros/foxy" \
		-DCATKIN_BUILD_BINARY_PACKAGE="1" \
		-DMODULE_VERSION="$(DEB_VER)$(CLEAN_VER)"; \
	make package --no-print-directory

test:
	@echo "no test"
