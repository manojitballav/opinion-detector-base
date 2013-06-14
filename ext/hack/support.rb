require 'opener/build-tools'

include Opener::BuildTools::Requirements
include Opener::BuildTools::Python
include Opener::BuildTools::Files

# Directory where packages will be installed to.
PYTHON_SITE_PACKAGES = File.expand_path(
  '../../../core/site-packages',
  __FILE__
)

# Directory containing the temporary files.
TMP_DIRECTORY = File.expand_path('../../../tmp', __FILE__)

# Path to the pip requirements file used to install requirements before
# packaging the Gem.
PRE_BUILD_REQUIREMENTS = File.expand_path(
  '../../../pre_build_requirements.txt',
  __FILE__
)

# Path to the pip requirements file used to install requirements upon Gem
# installation.
PRE_INSTALL_REQUIREMENTS = File.expand_path(
  '../../../pre_install_requirements.txt',
  __FILE__
)

VENDOR_DIRECTORY   = File.expand_path('../../../core/vendor', __FILE__)
VENDOR_BUILD_DIRECTORY   = File.expand_path('../../../core/vendor/build', __FILE__)
VENDOR_SRC_DIRECTORY     = File.expand_path('../../../core/vendor/src', __FILE__)

##
# Verifies the requirements to install thi Gem.
#
def verify_requirements
  require_executable('python')
  require_version('python', python_version, '2.7.0')
  require_executable('pip')
end

def compile(args=[])
  system "./configure #{args.join(' ')}"
  system 'make'
  system 'make install'
end