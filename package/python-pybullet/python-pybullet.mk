################################################################################
#
# python-pybullet
#
################################################################################

PYTHON_PYBULLET_VERSION = 3.1.0
PYTHON_PYBULLET_SOURCE = pybullet-$(PYTHON_PYBULLET_VERSION).tar.gz
PYTHON_PYBULLET_SITE = https://files.pythonhosted.org/packages/10/7c/ae100d3b9d2ce5498ad89e69ddf20986edc275a98aedab64a334e2e41cfb
PYTHON_PYBULLET_SETUP_TYPE = distutils
PYTHON_PYBULLET_LICENSE = zlib/libpng License
PYTHON_PYBULLET_LICENSE_FILES = LICENSE.txt examples/ThirdPartyLibs/glad/LICENSE.txt examples/ThirdPartyLibs/Eigen/LICENSE.txt examples/pybullet/gym/pybullet_data/franka_panda/LICENSE.txt examples/pybullet/gym/pybullet_data/bicycle/LICENSE.txt examples/pybullet/gym/pybullet_data/domino/license.txt examples/pybullet/gym/pybullet_data/laikago/license.txt examples/SharedMemory/plugins/stablePDPlugin/LICENSE.txt

$(eval $(python-package))
