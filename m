Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.1428.1616429471253707106
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Mar 2021 09:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: from localhost (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 494B210000D;
	Mon, 22 Mar 2021 16:11:08 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] Do not assume working from $HOME
Date: Mon, 22 Mar 2021 17:10:57 +0100
Message-Id: <20210322161057.77080-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the "Yocto Project Quick Build" instructions
(https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#)
there is an inconsistency that impacts several documents...

People are first instructed to clone the poky git repository, but not
mentioning from which directory. Then, it's consistent to instruct
people to run "cd poky/".

However, later in the instructions, readers are instructed to run "cd
~/poky", which assumes that cloning poky was done from the home
directory. Many other places in the documentation make such an assumption.

This change fixes this, and makes no assumption on where people
have chosen to store their data, in particular where they cloned
the "poky" repository.

This also fixes a few whitespace issues.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README                          |  2 +-
 documentation/brief-yoctoprojectqs/index.rst  |  8 ++--
 documentation/dev-manual/common-tasks.rst     | 20 ++++----
 documentation/dev-manual/qemu.rst             |  4 +-
 documentation/dev-manual/start.rst            |  2 +-
 documentation/kernel-dev/common.rst           | 47 +++++++++----------
 documentation/ref-manual/terms.rst            | 11 ++---
 documentation/sdk-manual/appendix-obtain.rst  |  4 +-
 documentation/sdk-manual/extensible.rst       |  2 +-
 documentation/toaster-manual/reference.rst    |  2 +-
 .../toaster-manual/setup-and-use.rst          | 10 ++--
 11 files changed, 54 insertions(+), 58 deletions(-)

diff --git a/documentation/README b/documentation/README
index be03bb119..15623ce6c 100644
--- a/documentation/README
+++ b/documentation/README
@@ -222,7 +222,7 @@ For example, the following .rst content will produce the 'expected'
 content:
 
   .. code-block::
-      $ mkdir ~/poky-&DISTRO;
+      $ mkdir poky-&DISTRO;
       or
       $ git clone &YOCTO_GIT_URL;/git/poky -b &DISTRO_NAME_NO_CAP;
 
diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 63083cb13..11c67bc35 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -176,7 +176,7 @@ an entire Linux distribution, including the toolchain, from source.
 
    .. code-block:: shell
 
-      $ cd ~/poky
+      $ cd poky
       $ source oe-init-build-env
       You had no conf/local.conf file. This configuration file has therefore been
       created for you with some default values. You may wish to edit it to, for
@@ -293,7 +293,7 @@ Follow these steps to add a hardware layer:
 
    .. code-block:: shell
 
-      $ cd ~/poky
+      $ cd poky
       $ git clone https://github.com/kraj/meta-altera.git
       Cloning into 'meta-altera'...
       remote: Counting objects: 25170, done.
@@ -337,7 +337,7 @@ Follow these steps to add a hardware layer:
 
    .. code-block:: shell
 
-      $ cd ~/poky/build
+      $ cd poky/build
       $ bitbake-layers add-layer ../meta-altera
       NOTE: Starting bitbake server...
       Parsing recipes: 100% |##################################################################| Time: 0:00:32
@@ -374,7 +374,7 @@ The following commands run the tool to create a layer named
 
 .. code-block:: shell
 
-   $ cd ~/poky
+   $ cd poky
    $ bitbake-layers create-layer meta-mylayer
    NOTE: Starting bitbake server...
    Add your new layer with 'bitbake-layers add-layer meta-mylayer'
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b7b59c172..820b8314d 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3007,7 +3007,7 @@ The following steps describe how to set up the AUH utility:
    running the AUH utility:
    ::
 
-      $ cd ~/poky
+      $ cd poky
       $ source oe-init-build-env your_AUH_build_directory
 
    Re-using an existing build directory and its configurations is not
@@ -5956,8 +5956,8 @@ the existing kernel, and then inserts a new kernel:
    kernel:
    ::
 
-      $ wic cp ~/poky_sdk/tmp/work/qemux86-poky-linux/linux-yocto/4.12.12+git999-r0/linux-yocto-4.12.12+git999/arch/x86/boot/bzImage \
-               ~/poky/build/tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1/vmlinuz
+      $ wic cp poky_sdk/tmp/work/qemux86-poky-linux/linux-yocto/4.12.12+git999-r0/linux-yocto-4.12.12+git999/arch/x86/boot/bzImage \
+               poky/build/tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1/vmlinuz
 
    Once the new kernel is added back into the image, you can use the
    ``dd`` command or :ref:`bmaptool
@@ -6956,7 +6956,7 @@ variable to specify the format:
 
 1. Open the ``local.conf`` file inside your
    :term:`Build Directory` (e.g.
-   ``~/poky/build/conf/local.conf``).
+   ``poky/build/conf/local.conf``).
 
 2. Select the desired package format as follows:
    ::
@@ -7048,11 +7048,11 @@ From within the build directory where you have built an image based on
 your packaging choice (i.e. the
 :term:`PACKAGE_CLASSES`
 setting), simply start the server. The following example assumes a build
-directory of ``~/poky/build/tmp/deploy/rpm`` and a ``PACKAGE_CLASSES``
+directory of ``poky/build/tmp/deploy/rpm`` and a ``PACKAGE_CLASSES``
 setting of "package_rpm":
 ::
 
-   $ cd ~/poky/build/tmp/deploy/rpm
+   $ cd poky/build/tmp/deploy/rpm
    $ python3 -m http.server
 
 Target Setup
@@ -8409,7 +8409,7 @@ that queries the Git repository and prints just the differences that
 might be significant in human-readable form. Here is an example:
 ::
 
-   $ ~/poky/poky/scripts/buildhistory-diff . HEAD^
+   $ poky/poky/scripts/buildhistory-diff . HEAD^
    Changes to images/qemux86_64/glibc/core-image-minimal (files-in-image.txt):
       /etc/anotherpkg.conf was added
       /sbin/anotherpkg was added
@@ -10738,7 +10738,7 @@ been followed:
    are ``create-pull-request`` and ``send-pull-request``. You can find
    these scripts in the ``scripts`` directory within the
    :term:`Source Directory` (e.g.
-   ``~/poky/scripts``).
+   ``poky/scripts``).
 
    Using these scripts correctly formats the requests without
    introducing any whitespace or HTML formatting. The maintainer that
@@ -10752,7 +10752,7 @@ been followed:
    line in the created patch files:
    ::
 
-      $ ~/poky/scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
+      $ poky/scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
 
    Running this script forms ``*.patch`` files in a folder named
    ``pull-``\ `PID` in the current directory. One of the patch files is a
@@ -10766,7 +10766,7 @@ been followed:
    list:
    ::
 
-      $ ~/poky/scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@yoctoproject.org
+      $ poky/scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@yoctoproject.org
 
    You need to follow the prompts as the script is interactive.
 
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 766691b97..c6bb9e977 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -58,7 +58,7 @@ available. Follow these general steps to run QEMU:
       environment script (i.e. :ref:`structure-core-script`):
       ::
 
-         $ cd ~/poky
+         $ cd poky
          $ source oe-init-build-env
 
    -  If you installed a cross-toolchain, you can run the script that
@@ -66,7 +66,7 @@ available. Follow these general steps to run QEMU:
       the initialization script from the default ``poky_sdk`` directory:
       ::
 
-         . ~/poky_sdk/environment-setup-core2-64-poky-linux
+         . poky_sdk/environment-setup-core2-64-poky-linux
 
 3. *Ensure the Artifacts are in Place:* You need to be sure you have a
    pre-built kernel that will boot in QEMU. You also need the target
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 03061a79f..efe369c75 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -768,7 +768,7 @@ Follow these steps to create a local version of the upstream
    exists on your system and by default, it is checked out:
    ::
 
-      $ cd ~/poky
+      $ cd poky
       $ git status
       On branch master
       Your branch is up-to-date with 'origin/master'.
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 58adcc9b7..0e545d1b8 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -57,7 +57,7 @@ section:
    the build environment script (i.e. :ref:`structure-core-script`):
    ::
 
-      $ cd ~/poky
+      $ cd poky
       $ source oe-init-build-env
 
    .. note::
@@ -74,7 +74,7 @@ section:
    ``MACHINE`` variable appropriately in your ``conf/local.conf`` file
    found in the
    :term:`Build Directory` (i.e.
-   ``~/poky/build`` in this example).
+   ``poky/build`` in this example).
 
    Also, since you are preparing to work on the kernel image, you need
    to set the
@@ -94,7 +94,7 @@ section:
    ``bitbake-layers create-layer`` command as follows:
    ::
 
-      $ cd ~/poky/build
+      $ cd poky/build
       $ bitbake-layers create-layer ../../meta-mylayer
       NOTE: Starting bitbake server...
       Add your new layer with 'bitbake-layers add-layer ../../meta-mylayer'
@@ -119,7 +119,7 @@ section:
    ``bblayers.conf`` file as follows:
    ::
 
-      $ cd ~/poky/build
+      $ cd poky/build
       $ bitbake-layers add-layer ../../meta-mylayer
       NOTE: Starting bitbake server...
       $
@@ -128,7 +128,7 @@ section:
    specifically for use with images to be run using QEMU:
    ::
 
-      $ cd ~/poky/build
+      $ cd poky/build
       $ bitbake core-image-minimal -c populate_sdk_ext
 
    Once
@@ -136,21 +136,21 @@ section:
    ``*.sh`` file) in the following directory:
    ::
 
-      ~/poky/build/tmp/deploy/sdk
+      poky/build/tmp/deploy/sdk
 
    For this example, the installer file is named
    ``poky-glibc-x86_64-core-image-minimal-i586-toolchain-ext-&DISTRO;.sh``.
 
 6. *Install the Extensible SDK:* Use the following command to install
    the SDK. For this example, install the SDK in the default
-   ``~/poky_sdk`` directory:
+   ``poky_sdk`` directory:
    ::
 
-      $ cd ~/poky/build/tmp/deploy/sdk
+      $ cd poky/build/tmp/deploy/sdk
       $ ./poky-glibc-x86_64-core-image-minimal-i586-toolchain-ext-&DISTRO;.sh
       Poky (Yocto Project Reference Distro) Extensible SDK installer version &DISTRO;
       ============================================================================
-      Enter target directory for SDK (default: ~/poky_sdk):
+      Enter target directory for SDK (default: poky_sdk):
       You are about to install the SDK to "/home/scottrif/poky_sdk". Proceed [Y/n]? Y
       Extracting SDK......................................done
       Setting it up...
@@ -175,7 +175,7 @@ section:
    directed by the output from installing the SDK:
    ::
 
-      $ source ~/poky_sdk/environment-setup-i586-poky-linux
+      $ source poky_sdk/environment-setup-i586-poky-linux
       "SDK environment now set up; additionally you may now run devtool to perform development tasks.
       Run devtool --help for further details.
 
@@ -240,7 +240,7 @@ section:
    section in the Yocto Project Development Tasks Manual.
    ::
 
-      $ cd ~/poky
+      $ cd poky
       $ git branch
       master
       * &DISTRO_NAME_NO_CAP;
@@ -260,7 +260,7 @@ section:
    ``MACHINE`` variable appropriately in your ``conf/local.conf`` file
    found in the
    :term:`Build Directory` (i.e.
-   ``~/poky/build`` in this example).
+   ``poky/build`` in this example).
 
    Also, since you are preparing to work on the kernel image, you need
    to set the
@@ -280,7 +280,7 @@ section:
    ``bitbake-layers create-layer`` command as follows:
    ::
 
-      $ cd ~/poky/build
+      $ cd poky/build
       $ bitbake-layers create-layer ../../meta-mylayer
       NOTE: Starting bitbake server...
       Add your new layer with 'bitbake-layers add-layer ../../meta-mylayer'
@@ -304,7 +304,7 @@ section:
    ``bblayers.conf`` file as follows:
    ::
 
-      $ cd ~/poky/build
+      $ cd poky/build
       $ bitbake-layers add-layer ../../meta-mylayer
       NOTE: Starting bitbake server ...
       $
@@ -398,7 +398,6 @@ home directory:
 1. *Create Structure*: Create the layer's structure:
    ::
 
-      $ cd $HOME
       $ mkdir meta-mylayer
       $ mkdir meta-mylayer/conf
       $ mkdir meta-mylayer/recipes-kernel
@@ -819,12 +818,12 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
 
    1. *Change the working directory*: In the previous step, the output
       noted where you can find the source files (e.g.
-      ``~/poky_sdk/workspace/sources/linux-yocto``). Change to where the
+      ``poky_sdk/workspace/sources/linux-yocto``). Change to where the
       kernel source code is before making your edits to the
       ``calibrate.c`` file:
       ::
 
-         $ cd ~/poky_sdk/workspace/sources/linux-yocto
+         $ cd poky_sdk/workspace/sources/linux-yocto
 
    2. *Edit the source file*: Edit the ``init/calibrate.c`` file to have
       the following changes:
@@ -896,7 +895,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
    and use these Git commands to stage and commit your changes:
    ::
 
-      $ cd ~/poky_sdk/workspace/sources/linux-yocto
+      $ cd poky_sdk/workspace/sources/linux-yocto
       $ git status
       $ git add init/calibrate.c
       $ git commit -m "calibrate: Add printk example"
@@ -926,7 +925,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
    set up to run BitBake:
    ::
 
-      $ cd ~/poky/build
+      $ cd poky/build
       $ bitbake core-image-minimal
 
 Using Traditional Kernel Development to Patch the Kernel
@@ -1015,7 +1014,7 @@ Section.
    to the following to your ``local.conf``:
    ::
 
-      $ cd ~/poky/build/conf
+      $ cd poky/build/conf
 
    Add the following to the ``local.conf``:
    ::
@@ -1037,7 +1036,7 @@ Section.
    you can now use BitBake to build the image:
    ::
 
-      $ cd ~/poky/build
+      $ cd poky/build
       $ bitbake core-image-minimal
 
 5. *Boot the image*: Boot the modified image in the QEMU emulator using
@@ -1045,7 +1044,7 @@ Section.
    with no password:
    ::
 
-      $ cd ~/poky/build
+      $ cd poky/build
       $ runqemu qemux86
 
 6. *Look for Your Changes:* As QEMU booted, you might have seen your
@@ -1119,7 +1118,7 @@ Section.
       the following sequence of commands:
       ::
 
-              $ cd ~/poky/build
+              $ cd poky/build
               $ bitbake -c cleanall yocto-linux
               $ bitbake core-image-minimal -c cleanall
               $ bitbake core-image-minimal
@@ -1172,7 +1171,7 @@ environment, you must do the following:
 The following commands initialize the BitBake environment, run the
 :ref:`ref-tasks-kernel_configme`
 task, and launch ``menuconfig``. These commands assume the Source
-Directory's top-level folder is ``~/poky``:
+Directory's top-level folder is ``poky``:
 ::
 
    $ cd poky
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index bf4614887..32bb75b27 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -28,7 +28,7 @@ universal, the list includes them just in case:
       to allow for matching recipe names. For example, suppose you have an
       append file named as follows:
       ::
-      
+
          busybox_1.21.%.bbappend
 
       That append file
@@ -76,7 +76,7 @@ universal, the list includes them just in case:
 
             .. code-block:: shell
 
-               $ cd $HOME/poky
+               $ cd poky
                $ source oe-init-build-env
 
          -  Create the Build Directory inside your home directory and
@@ -84,19 +84,16 @@ universal, the list includes them just in case:
 
             .. code-block:: shell
 
-               $ cd $HOME
                $ source poky/oe-init-build-env test-builds
 
          -  Provide a directory path and specifically name the Build
             Directory. Any intermediate folders in the pathname must exist.
             This next example creates a Build Directory named
-            ``YP-&POKYVERSION;`` in your home directory within the existing
-            directory ``mybuilds``:
+            ``YP-&POKYVERSION;`` within the existing directory ``mybuilds``:
 
             .. code-block:: shell
 
-               $ cd $HOME
-               $ source $HOME/poky/oe-init-build-env $HOME/mybuilds/YP-&POKYVERSION;
+               $ source poky/oe-init-build-env mybuilds/YP-&POKYVERSION;
 
       .. note::
 
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index f158c244a..395102c3b 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -173,7 +173,7 @@ build the SDK installer. Follow these steps:
    ``tmp/deploy/sdk`` in the Build Directory. Following is an example:
    ::
 
-      $ cd ~/poky/build/tmp/deploy/sdk
+      $ cd poky/build/tmp/deploy/sdk
       $ ./poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
 
    During execution of the script, you choose the root location for the
@@ -249,7 +249,7 @@ Follow these steps to extract the root filesystem:
    ":ref:`sdk-manual/appendix-obtain:locating pre-built sdk installers`" section:
    ::
 
-      $ source ~/poky_sdk/environment-setup-core2-64-poky-linux
+      $ source poky_sdk/environment-setup-core2-64-poky-linux
 
 3. *Extract the Root Filesystem:* Use the ``runqemu-extract-sdk``
    command and provide the root filesystem image.
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 5962e9460..d2ed9a9b8 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -118,7 +118,7 @@ architecture. The example assumes the SDK installer is located in
    $ ./Downloads/poky-glibc-x86_64-core-image-minimal-core2-64-toolchain-ext-2.5.sh
    Poky (Yocto Project Reference Distro) Extensible SDK installer version 2.5
    ==========================================================================
-   Enter target directory for SDK (default: ~/poky_sdk):
+   Enter target directory for SDK (default: poky_sdk):
    You are about to install the SDK to "/home/scottrif/poky_sdk". Proceed [Y/n]? Y
    Extracting SDK..............done
    Setting it up...
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index d2ab14c8e..8ef58182e 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -554,7 +554,7 @@ example that assumes default repository and build directory names:
 
 .. code-block:: shell
 
-   $ cd ~/poky/build
+   $ cd poky/build
    $ python ../bitbake/lib/toaster/manage.py buildslist
 
 If your Toaster database had only one build, the above
diff --git a/documentation/toaster-manual/setup-and-use.rst b/documentation/toaster-manual/setup-and-use.rst
index ded771e79..cabf0250c 100644
--- a/documentation/toaster-manual/setup-and-use.rst
+++ b/documentation/toaster-manual/setup-and-use.rst
@@ -155,7 +155,7 @@ superuser by following these steps:
    is the :term:`Build Directory`,
    invoke the ``createsuperuser`` command from ``manage.py``::
 
-      $ cd ~/poky/build
+      $ cd poky/build
       $ ../bitbake/lib/toaster/manage.py createsuperuser
 
 #. Django prompts you for the username, which you need to provide.
@@ -417,13 +417,13 @@ Perform the following steps to install Toaster:
 
       [Unit]
       Description=Toaster runbuilds
-      
+
       [Service]
       Type=forking User=toaster
       ExecStart=/usr/bin/screen -d -m -S runbuilds /var/www/toaster/poky/bitbake/lib/toaster/runbuilds-service.sh start
       ExecStop=/usr/bin/screen -S runbuilds -X quit
       WorkingDirectory=/var/www/toaster/poky
-      
+
       [Install]
       WantedBy=multi-user.target
 
@@ -433,11 +433,11 @@ Perform the following steps to install Toaster:
     up executable permissions::
 
       #!/bin/bash
-      
+
       #export http_proxy=http://proxy.host.com:8080
       #export https_proxy=http://proxy.host.com:8080
       #export GIT_PROXY_COMMAND=$HOME/bin/gitproxy
-      cd ~/poky/
+      cd poky/
       source ./oe-init-build-env build
       source ../bitbake/bin/toaster $1 noweb
       [ "$1" == 'start' ] && /bin/bash
-- 
2.25.1

