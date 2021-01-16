Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.2900.1610795777391047399
 for <docs@lists.yoctoproject.org>;
 Sat, 16 Jan 2021 03:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.197, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.100.75
Received: from localhost.localdomain (80-110-100-75.cgn.dynamic.surfer.at [80.110.100.75])
	(Authenticated sender: foss@0leil.net)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPA id EC47B1C0005;
	Sat, 16 Jan 2021 11:16:14 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH] docs: fix missing & and ; surrounding references from poky.yaml
Date: Sat, 16 Jan 2021 12:16:03 +0100
Message-Id: <20210116111603.60983-1-foss@0leil.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

poky.yaml references are only replaced in files if they are prefixed by
& and suffixed by ;.

Let's fix the missing surrounding characters.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/kernel-dev/common.rst              | 2 +-
 documentation/ref-manual/devtool-reference.rst   | 8 ++++----
 documentation/ref-manual/release-process.rst     | 4 ++--
 documentation/ref-manual/system-requirements.rst | 4 ++--
 documentation/ref-manual/terms.rst               | 4 ++--
 documentation/ref-manual/variables.rst           | 4 ++--
 documentation/sdk-manual/appendix-obtain.rst     | 6 +++---
 documentation/sdk-manual/extensible.rst          | 4 ++--
 documentation/sdk-manual/working-projects.rst    | 4 ++--
 9 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 6691da448..58adcc9b7 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -139,7 +139,7 @@ section:
       ~/poky/build/tmp/deploy/sdk
 
    For this example, the installer file is named
-   ``poky-glibc-x86_64-core-image-minimal-i586-toolchain-ext-DISTRO.sh``.
+   ``poky-glibc-x86_64-core-image-minimal-i586-toolchain-ext-&DISTRO;.sh``.
 
 6. *Install the Extensible SDK:* Use the following command to install
    the SDK. For this example, install the SDK in the default
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index cc5848fd4..5075f0c22 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -204,20 +204,20 @@ specify these options when using the ``devtool add`` command:
 -  To specify a source branch, use the ``--srcbranch`` option:
    ::
 
-      $ devtool add --srcbranch DISTRO_NAME_NO_CAP jackson /home/user/sources/jackson
+      $ devtool add --srcbranch &DISTRO_NAME_NO_CAP; jackson /home/user/sources/jackson
 
-   In the previous example, you are checking out the DISTRO_NAME_NO_CAP
+   In the previous example, you are checking out the &DISTRO_NAME_NO_CAP;
    branch.
 
 -  To specify a specific tag or commit hash, use the ``--srcrev``
    option:
    ::
 
-      $ devtool add --srcrev DISTRO_REL_TAG jackson /home/user/sources/jackson
+      $ devtool add --srcrev &DISTRO_REL_TAG; jackson /home/user/sources/jackson
       $ devtool add --srcrev some_commit_hash /home/user/sources/jackson
 
    The previous examples check out the
-   DISTRO_REL_TAG tag and the commit associated with the
+   &DISTRO_REL_TAG; tag and the commit associated with the
    some_commit_hash hash.
 
 .. note::
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index d8d362282..ed5a09a55 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -12,7 +12,7 @@ stability.
 Major and Minor Release Cadence
 ===============================
 
-The Yocto Project delivers major releases (e.g. DISTRO) using a six
+The Yocto Project delivers major releases (e.g. &DISTRO;) using a six
 month cadence roughly timed each April and October of the year.
 Following are examples of some major YP releases with their codenames
 also shown. See the "`Major Release
@@ -57,7 +57,7 @@ codename are likely to be compatible and thus work together.
 .. note::
 
    Codenames are associated with major releases because a Yocto Project
-   release number (e.g. DISTRO) could conflict with a given layer or
+   release number (e.g. &DISTRO;) could conflict with a given layer or
    company versioning scheme. Codenames are unique, interesting, and
    easily identifiable.
 
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 66afb0810..c8c1381cb 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -340,12 +340,12 @@ of the two methods by which you can get these tools:
    traditional installer:
    ::
 
-      $ sh ~/Downloads/x86_64-buildtools-nativesdk-standalone-DISTRO.sh
+      $ sh ~/Downloads/x86_64-buildtools-nativesdk-standalone-&DISTRO;.sh
 
    Here is an example for the extended installer:
    ::
 
-      $ sh ~/Downloads/x86_64-buildtools-extended-nativesdk-standalone-DISTRO.sh
+      $ sh ~/Downloads/x86_64-buildtools-extended-nativesdk-standalone-&DISTRO;.sh
 
    During execution, a prompt appears that allows you to choose the
    installation directory. For example, you could choose the following:
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 966962005..bf4614887 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -90,13 +90,13 @@ universal, the list includes them just in case:
          -  Provide a directory path and specifically name the Build
             Directory. Any intermediate folders in the pathname must exist.
             This next example creates a Build Directory named
-            ``YP-POKYVERSION`` in your home directory within the existing
+            ``YP-&POKYVERSION;`` in your home directory within the existing
             directory ``mybuilds``:
 
             .. code-block:: shell
 
                $ cd $HOME
-               $ source $HOME/poky/oe-init-build-env $HOME/mybuilds/YP-POKYVERSION
+               $ source $HOME/poky/oe-init-build-env $HOME/mybuilds/YP-&POKYVERSION;
 
       .. note::
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4ce264813..5ec19970e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4202,11 +4202,11 @@ system and gives an overview of their function and contents.
       this variable in your layer's ``conf/layer.conf`` configuration file.
       For the list, use the Yocto Project
       :yocto_wiki:`Release Name </Releases>` (e.g.
-      DISTRO_NAME_NO_CAP). To specify multiple OE-Core versions for the
+      &DISTRO_NAME_NO_CAP;). To specify multiple OE-Core versions for the
       layer, use a space-separated list:
       ::
 
-         LAYERSERIES_COMPAT_layer_root_name = "DISTRO_NAME_NO_CAP DISTRO_NAME_NO_CAP_MINUS_ONE"
+         LAYERSERIES_COMPAT_layer_root_name = "&DISTRO_NAME_NO_CAP; &DISTRO_NAME_NO_CAP_MINUS_ONE;"
 
       .. note::
 
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index cdfe2cc85..f158c244a 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -58,14 +58,14 @@ Follow these steps to locate and hand-install the toolchain:
    folder and download the following installer:
    ::
 
-      poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-DISTRO.sh
+      poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
 
 4. *Run the Installer:* Be sure you have execution privileges and run
    the installer. Following is an example from the ``Downloads``
    directory:
    ::
 
-      $ ~/Downloads/poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-DISTRO.sh
+      $ ~/Downloads/poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
 
    During execution of the script, you choose the root location for the
    toolchain. See the "`Installed Standard SDK Directory
@@ -174,7 +174,7 @@ build the SDK installer. Follow these steps:
    ::
 
       $ cd ~/poky/build/tmp/deploy/sdk
-      $ ./poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-DISTRO.sh
+      $ ./poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
 
    During execution of the script, you choose the root location for the
    toolchain. See the "`Installed Standard SDK Directory
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index c94213d6c..5962e9460 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -82,10 +82,10 @@ is the general form:
 
 For example, the following SDK installer is for a 64-bit
 development host system and a i586-tuned target architecture based off
-the SDK for ``core-image-sato`` and using the current DISTRO snapshot:
+the SDK for ``core-image-sato`` and using the current &DISTRO; snapshot:
 ::
 
-   poky-glibc-x86_64-core-image-sato-i586-toolchain-ext-DISTRO.sh
+   poky-glibc-x86_64-core-image-sato-i586-toolchain-ext-&DISTRO;.sh
 
 .. note::
 
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index 3e40936ff..bddf00a7d 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -292,11 +292,11 @@ example:
    the string "environment-setup" and contains the machine architecture,
    which is followed by the string "poky-linux". For this example, the
    command sources a script from the default SDK installation directory
-   that uses the 32-bit Intel x86 Architecture and the DISTRO_NAME Yocto
+   that uses the 32-bit Intel x86 Architecture and the &DISTRO_NAME; Yocto
    Project release:
    ::
 
-      $ source /opt/poky/DISTRO/environment-setup-i586-poky-linux
+      $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
 3. *Create the Makefile:* For this example, the Makefile contains
    two lines that can be used to set the ``CC`` variable. One line is
-- 
2.29.2

