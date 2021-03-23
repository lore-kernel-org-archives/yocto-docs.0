Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.763.1616519197928095431
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 10:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from localhost (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 20B186000A;
	Tue, 23 Mar 2021 17:06:35 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] Spellcheck and capitalization fixes
Date: Tue, 23 Mar 2021 18:06:24 +0100
Message-Id: <20210323170624.112564-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Spelling fixes found using Emacs' spelling checker
  configured for US English
- Fixes for some capitalization issues, especially some
  project names (QEMU, openSUSE, BusyBox), that were not
  consistently used with the same capitalization anyway.
- A few whitespace fixes too

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/boilerplate.rst                 |  2 +-
 documentation/brief-yoctoprojectqs/index.rst  |  2 +-
 documentation/bsp-guide/bsp.rst               |  2 +-
 documentation/dev-manual/common-tasks.rst     |  8 +++---
 documentation/profile-manual/usage.rst        | 26 +++++++++----------
 documentation/ref-manual/kickstart.rst        |  4 +--
 documentation/ref-manual/migration-3.2.rst    |  2 +-
 documentation/ref-manual/resources.rst        |  4 +--
 documentation/ref-manual/structure.rst        |  2 +-
 .../ref-manual/system-requirements.rst        |  2 +-
 documentation/ref-manual/terms.rst            |  2 +-
 documentation/ref-manual/variables.rst        | 12 ++++-----
 documentation/test-manual/intro.rst           | 10 +++----
 documentation/test-manual/test-process.rst    |  4 +--
 .../test-manual/understand-autobuilder.rst    | 12 ++++-----
 .../toaster-manual/setup-and-use.rst          |  8 +++---
 16 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/documentation/boilerplate.rst b/documentation/boilerplate.rst
index 2ad60eb8b..baccc9fe4 100644
--- a/documentation/boilerplate.rst
+++ b/documentation/boilerplate.rst
@@ -14,5 +14,5 @@ Commons.
 To report any inaccuracies or problems with this (or any other Yocto Project)
 manual, or to send additions or changes, please send email/patches to the Yocto
 Project documentation mailing list at ``docs@lists.yoctoproject.org`` or
-log into the freenode ``#yocto`` channel.
+log into the Freenode ``#yocto`` channel.
 
diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 63083cb13..31cc28a38 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -204,7 +204,7 @@ an entire Linux distribution, including the toolchain, from source.
           meta-toolchain
           meta-ide-support
 
-      You can also run generated qemu images with a command like 'runqemu qemux86-64'
+      You can also run generated QEMU images with a command like 'runqemu qemux86-64'
 
    Among other things, the script creates the :term:`Build Directory`, which is
    ``build`` in this case and is located in the :term:`Source Directory`.  After
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 93e918249..c24ab28ea 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -289,7 +289,7 @@ individual BSPs could differ. ::
    meta-bsp_root_name/recipes-kernel/linux/linux-yocto_kernel_rev.bbappend
 
 Below is an example of the Raspberry Pi BSP layer that is available from
-the :yocto_git:`Source Respositories <>`:
+the :yocto_git:`Source Repositories <>`:
 
 .. code-block:: none
 
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b7b59c172..b1c699049 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -5362,7 +5362,7 @@ command to return the available Wic images as follows:
      genericx86                    		Create an EFI disk image for genericx86*
      beaglebone-yocto              		Create SD card image for Beaglebone
      edgerouter                    		Create SD card image for Edgerouter
-     qemux86-directdisk            		Create a qemu machine 'pcbios' direct disk image
+     qemux86-directdisk            		Create a QEMU machine 'pcbios' direct disk image
      directdisk-gpt                		Create a 'pcbios' direct disk image
      mkefidisk                     		Create an EFI disk image
      directdisk                    		Create a 'pcbios' direct disk image
@@ -5509,7 +5509,7 @@ Use the following command to list the available kickstart files:
      genericx86                    		Create an EFI disk image for genericx86*
      beaglebone-yocto              		Create SD card image for Beaglebone
      edgerouter                    		Create SD card image for Edgerouter
-     qemux86-directdisk            		Create a qemu machine 'pcbios' direct disk image
+     qemux86-directdisk            		Create a QEMU machine 'pcbios' direct disk image
      directdisk-gpt                		Create a 'pcbios' direct disk image
      mkefidisk                     		Create an EFI disk image
      directdisk                    		Create a 'pcbios' direct disk image
@@ -8522,7 +8522,7 @@ In order to run tests, you need to do the following:
 
    -  Ubuntu and Debian: ``sysstat`` and ``iproute2``
 
-   -  OpenSUSE: ``sysstat`` and ``iproute2``
+   -  openSUSE: ``sysstat`` and ``iproute2``
 
    -  Fedora: ``sysstat`` and ``iproute``
 
@@ -8648,7 +8648,7 @@ perform a one-time setup of your master image by doing the following:
 
    -  Inherits ``core-image`` so that kernel modules are installed.
 
-   -  Installs normal linux utilities not busybox ones (e.g. ``bash``,
+   -  Installs normal linux utilities not BusyBox ones (e.g. ``bash``,
       ``coreutils``, ``tar``, ``gzip``, and ``kmod``).
 
    -  Uses a custom Initial RAM Disk (initramfs) image with a custom
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index b401cf904..fd6da6fc4 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -100,8 +100,8 @@ Using perf to do Basic Profiling
 As a simple test case, we'll profile the 'wget' of a fairly large file,
 which is a minimally interesting case because it has both file and
 network I/O aspects, and at least in the case of standard Yocto images,
-it's implemented as part of busybox, so the methods we use to analyze it
-can be used in a very similar way to the whole host of supported busybox
+it's implemented as part of BusyBox, so the methods we use to analyze it
+can be used in a very similar way to the whole host of supported BusyBox
 applets in Yocto. ::
 
    root@crownbay:~# rm linux-2.6.19.2.tar.bz2; \
@@ -251,7 +251,7 @@ As a bit of background explanation for these callchains, think about
 what happens at a high level when you run wget to get a file out on the
 network. Basically what happens is that the data comes into the kernel
 via the network connection (socket) and is passed to the userspace
-program 'wget' (which is actually a part of busybox, but that's not
+program 'wget' (which is actually a part of BusyBox, but that's not
 important for now), which takes the buffers the kernel passes to it and
 writes it to a disk file to save it.
 
@@ -277,16 +277,16 @@ Now that we've seen the basic layout of the profile data and the basics
 of how to extract useful information out of it, let's get back to the
 task at hand and see if we can get some basic idea about where the time
 is spent in the program we're profiling, wget. Remember that wget is
-actually implemented as an applet in busybox, so while the process name
-is 'wget', the executable we're actually interested in is busybox. So
-let's expand the first entry containing busybox:
+actually implemented as an applet in BusyBox, so while the process name
+is 'wget', the executable we're actually interested in is BusyBox. So
+let's expand the first entry containing BusyBox:
 
 .. image:: figures/perf-wget-busybox-expanded-stripped.png
    :align: center
 
 Again, before we expanded we saw that the function was labeled with a
 hex value instead of a symbol as with most of the kernel entries.
-Expanding the busybox entry doesn't make it any better.
+Expanding the BusyBox entry doesn't make it any better.
 
 The problem is that perf can't find the symbol information for the
 busybox binary, which is actually stripped out by the Yocto build
@@ -299,7 +299,7 @@ when you build the image: ::
 
 However, we already have an image with the binaries stripped, so
 what can we do to get perf to resolve the symbols? Basically we need to
-install the debuginfo for the busybox package.
+install the debuginfo for the BusyBox package.
 
 To generate the debug info for the packages in the image, we can add
 ``dbg-pkgs`` to :term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example: ::
@@ -314,7 +314,7 @@ in the ``local.conf`` file: ::
    PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
 
 Once we've done that, we can install the
-debuginfo for busybox. The debug packages once built can be found in
+debuginfo for BusyBox. The debug packages once built can be found in
 ``build/tmp/deploy/rpm/*`` on the host system. Find the busybox-dbg-...rpm
 file and copy it to the target. For example: ::
 
@@ -325,7 +325,7 @@ Now install the debug rpm on the target: ::
 
    root@crownbay:~# rpm -i busybox-dbg-1.20.2-r2.core2_32.rpm
 
-Now that the debuginfo is installed, we see that the busybox entries now display
+Now that the debuginfo is installed, we see that the BusyBox entries now display
 their functions symbolically:
 
 .. image:: figures/perf-wget-busybox-debuginfo.png
@@ -345,11 +345,11 @@ expanded all the nodes using the 'E' key):
 .. image:: figures/perf-wget-busybox-dso-zoom.png
    :align: center
 
-Finally, we can see that now that the busybox debuginfo is installed,
+Finally, we can see that now that the BusyBox debuginfo is installed,
 the previously unresolved symbol in the ``sys_clock_gettime()`` entry
 mentioned previously is now resolved, and shows that the
 sys_clock_gettime system call that was the source of 6.75% of the
-copy-to-user overhead was initiated by the ``handle_input()`` busybox
+copy-to-user overhead was initiated by the ``handle_input()`` BusyBox
 function:
 
 .. image:: figures/perf-wget-g-copy-to-user-expanded-debuginfo.png
@@ -1900,7 +1900,7 @@ the target: ::
             meta-toolchain
             meta-ide-support
 
-   You can also run generated qemu images with a command like 'runqemu qemux86-64'
+   You can also run generated QEMU images with a command like 'runqemu qemux86-64'
 
 Once you've done that, you can cd to whatever
 directory contains your scripts and use 'crosstap' to run the script: ::
diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 472820f16..b87cdc13b 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -33,7 +33,7 @@ Either of these commands creates a partition on the system and uses the
 following syntax:
 ::
 
-   part [mntpoint] 
+   part [mntpoint]
    partition [mntpoint]
 
 If you do not
@@ -55,7 +55,7 @@ must also provide one of the ``--ondrive``, ``--ondisk``, or
 .. note::
 
    The mount program must understand the PARTUUID syntax you use with
-   ``--use-uuid`` and non-root *mountpoint*, including swap. The busybox
+   ``--use-uuid`` and non-root *mountpoint*, including swap. The BusyBox
    versions of these application are currently excluded.
 
 Here is an example that uses "/" as the mountpoint. The command uses
diff --git a/documentation/ref-manual/migration-3.2.rst b/documentation/ref-manual/migration-3.2.rst
index 65a9ff4ca..cca8124f2 100644
--- a/documentation/ref-manual/migration-3.2.rst
+++ b/documentation/ref-manual/migration-3.2.rst
@@ -308,6 +308,6 @@ Miscellaneous changes
 - Erroneous use of ``inherit +=`` (instead of ``INHERIT +=``) in a configuration file now triggers an error instead of silently being ignored.
 - ptest support has been removed from the ``kbd`` recipe, as upstream has moved to autotest which is difficult to work with in a cross-compilation environment.
 - ``oe.utils.is_machine_specific()`` and ``oe.utils.machine_paths()`` have been removed as their utility was questionable. In the unlikely event that you have references to these in your own code, then the code will need to be reworked.
-- The ``i2ctransfer`` module is now disabled by default when building ``busybox`` in order to be consistent with disabling the other i2c tools there. If you do wish the i2ctransfer module to be built in busybox then add ``CONFIG_I2CTRANSFER=y`` to your custom busybox configuration.
+- The ``i2ctransfer`` module is now disabled by default when building ``busybox`` in order to be consistent with disabling the other i2c tools there. If you do wish the i2ctransfer module to be built in BusyBox then add ``CONFIG_I2CTRANSFER=y`` to your custom BusyBox configuration.
 - In the ``Upstream-Status`` header convention for patches, ``Accepted`` has been replaced with ``Backport`` as these almost always mean the same thing i.e. the patch is already upstream and may need to be removed in a future recipe upgrade. If you are adding these headers to your own patches then use ``Backport`` to indicate that the patch has been sent upstream.
 - The ``tune-supersparc.inc`` tune file has been removed as it does not appear to be widely used and no longer works.
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 7554164d1..663f0d96d 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -91,7 +91,7 @@ For more Yocto Project-related mailing lists, see the
 Internet Relay Chat (IRC)
 =========================
 
-Two IRC channels on freenode are available for the Yocto Project and
+Two IRC channels on Freenode are available for the Yocto Project and
 Poky discussions:
 
 -  ``#yocto``
@@ -189,7 +189,7 @@ Here is a list of resources you might find helpful:
    implementation of Bugzilla for logging and tracking Yocto Project
    defects.
 
--  *Internet Relay Chat (IRC):* Two IRC channels on freenode are
+-  *Internet Relay Chat (IRC):* Two IRC channels on Freenode are
    available for Yocto Project and Poky discussions: ``#yocto`` and
    ``#poky``, respectively.
 
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index ad3f4ab44..0f2093a8d 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -168,7 +168,7 @@ possible targets to build. Here is an example:
        meta-toolchain
        meta-ide-support
 
-   You can also run generated qemu images with a command like 'runqemu qemux86-64'
+   You can also run generated QEMU images with a command like 'runqemu qemux86-64'
 
 The default output of the ``oe-init-build-env`` script is from the
 ``conf-notes.txt`` file, which is found in the ``meta-poky`` directory
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index c8c1381cb..9f423e7bb 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -59,7 +59,7 @@ distributions:
 
 -  Debian GNU/Linux 10.x (Buster)
 
--  OpenSUSE Leap 15.1
+-  openSUSE Leap 15.1
 
 
 .. note::
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index bf4614887..e4268eb56 100644
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
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4f441907b..0434a3712 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2576,7 +2576,7 @@ system and gives an overview of their function and contents.
       and new for generating new keys.
 
    :term:`FIT_KEY_SIGN_PKCS`
-      Format for public key ceritifcate used in signing fitImage.
+      Format for public key certificate used in signing fitImage.
       The default value is "x509".
 
    :term:`FIT_SIGN_ALG`
@@ -3443,7 +3443,7 @@ system and gives an overview of their function and contents.
 
          It is possible to define a list of licenses that are allowed to be
          used instead of the licenses that are excluded. To do this, define
-         a variable ``COMPATIBLE_LICENSES`` with the names of the licences
+         a variable ``COMPATIBLE_LICENSES`` with the names of the licenses
          that are allowed. Then define ``INCOMPATIBLE_LICENSE`` as:
          ::
 
@@ -3451,8 +3451,8 @@ system and gives an overview of their function and contents.
 
 
          This will result in ``INCOMPATIBLE_LICENSE`` containing the names of
-         all licences from :term:`AVAILABLE_LICENSES` except the ones specified
-         in ``COMPATIBLE_LICENSES`` , thus only allowing the latter licences to
+         all licenses from :term:`AVAILABLE_LICENSES` except the ones specified
+         in ``COMPATIBLE_LICENSES`` , thus only allowing the latter licenses to
          be used.
 
    :term:`INHERIT`
@@ -5005,7 +5005,7 @@ system and gives an overview of their function and contents.
          ${PN}-${PV}
 
    :term:`PACKAGE_ADD_METADATA`
-      This variable defines additional metdata to add to packages.
+      This variable defines additional metadata to add to packages.
 
       You may find you need to inject additional metadata into packages.
       This variable allows you to do that by setting the injected data as
@@ -7086,7 +7086,7 @@ system and gives an overview of their function and contents.
       -  ``git://`` - Fetches files from a Git revision control
          repository.
 
-      -  ``osc://`` - Fetches files from an OSC (OpenSUSE Build service)
+      -  ``osc://`` - Fetches files from an OSC (openSUSE Build service)
          revision control repository.
 
       -  ``repo://`` - Fetches files from a repo (Git) repository.
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 81c24a8c3..101d28366 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -26,7 +26,7 @@ engineers:
 
 -  *yocto-autobuilder2:* This
    :yocto_git:`README.md </yocto-autobuilder2/tree/README.md>`
-   is the main README which detials how to set up the Yocto Project
+   is the main README which details how to set up the Yocto Project
    Autobuilder. The ``yocto-autobuilder2`` repository represents the
    Yocto Project's console UI plugin to Buildbot and the configuration
    necessary to configure Buildbot to perform the testing the project
@@ -88,7 +88,7 @@ Yocto Project Tests - Types of Testing Overview
 ===============================================
 
 The Autobuilder tests different elements of the project by using
-thefollowing types of tests:
+the following types of tests:
 
 -  *Build Testing:* Tests whether specific configurations build by
    varying :term:`MACHINE`,
@@ -124,7 +124,7 @@ thefollowing types of tests:
    The tests utilize the ``testsdkext`` class and the ``do_testsdkext`` task.
 
 -  *Feature Testing:* Various scenario-based tests are run through the
-   :ref:`OpenEmbedded Self test (oe-selftest) <ref-manual/release-process:Testing and Quality Assurance>`. We test oe-selftest on each of the main distrubutions
+   :ref:`OpenEmbedded Self test (oe-selftest) <ref-manual/release-process:Testing and Quality Assurance>`. We test oe-selftest on each of the main distributions
    we support.
 
 -  *Image Testing:* Image tests initiated through the following command::
@@ -474,7 +474,7 @@ correctly. The test would only run if python3 is installed in the SDK.
 ----------------------
 
 The performance tests usually measure how long operations take and the
-resource utilisation as that happens. An example from
+resource utilization as that happens. An example from
 ``meta/lib/oeqa/buildperf/test_basic.py`` contains the following::
 
    class Test3(BuildPerfTestCase):
@@ -524,5 +524,5 @@ This is particularly true for oe-selftests since these can run in
 parallel and changing metadata leads to changing checksums, which
 confuses BitBake while running in parallel. If this is necessary, copy
 layers to a temporary location and modify them. Some tests need to
-change metadata, such as the devtool tests. To prevent the metadate from
+change metadata, such as the devtool tests. To protect the metadata from
 changes, set up temporary copies of that data first.
diff --git a/documentation/test-manual/test-process.rst b/documentation/test-manual/test-process.rst
index 8a5e29d92..508ead5fa 100644
--- a/documentation/test-manual/test-process.rst
+++ b/documentation/test-manual/test-process.rst
@@ -59,13 +59,13 @@ Release Builds
 
 The project typically has two major releases a year with a six month
 cadence in April and October. Between these there would be a number of
-milestone releases (usually four) with the final one being stablization
+milestone releases (usually four) with the final one being stabilization
 only along with point releases of our stable branches.
 
 The build and release process for these project releases is similar to
 that in `Day to Day Development <#test-daily-devel>`__, in that the
 a-full target of the Autobuilder is used but in addition the form is
-configured to generate and publish artefacts and the milestone number,
+configured to generate and publish artifacts and the milestone number,
 version, release candidate number and other information is entered. The
 box to "generate an email to QA"is also checked.
 
diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index 199cc97a8..2d9d6735a 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -9,14 +9,14 @@ Execution Flow within the Autobuilder
 
 The "a-full" and "a-quick" targets are the usual entry points into the
 Autobuilder and it makes sense to follow the process through the system
-starting there. This is best visualised from the Autobuilder Console
+starting there. This is best visualized from the Autobuilder Console
 view (:yocto_ab:`/typhoon/#/console`).
 
 Each item along the top of that view represents some "target build" and
 these targets are all run in parallel. The 'full' build will trigger the
 majority of them, the "quick" build will trigger some subset of them.
 The Autobuilder effectively runs whichever configuration is defined for
-each of those targets on a seperate buildbot worker. To understand the
+each of those targets on a separate buildbot worker. To understand the
 configuration, you need to look at the entry on ``config.json`` file
 within the ``yocto-autobuilder-helper`` repository. The targets are
 defined in the ‘overrides' section, a quick example could be qemux86-64
@@ -64,10 +64,10 @@ While not every detail of this is covered here, you can see how the
 template mechanism allows quite complex configurations to be built up
 yet allows duplication and repetition to be kept to a minimum.
 
-The different build targets are designed to allow for parallelisation,
+The different build targets are designed to allow for parallelization,
 so different machines are usually built in parallel, operations using
 the same machine and metadata are built sequentially, with the aim of
-trying to optimise build efficiency as much as possible.
+trying to optimize build efficiency as much as possible.
 
 The ``config.json`` file is processed by the scripts in the Helper
 repository in the ``scripts`` directory. The following section details
@@ -164,7 +164,7 @@ Autobuilder Worker Janitor
 
 This is a process running on each Worker that performs two basic
 operations, including background file deletion at IO idle (see :ref:`test-manual/understand-autobuilder:Autobuilder Target Execution Overview`: Run clobberdir) and
-maintainenance of a cache of cloned repositories to improve the speed
+maintenance of a cache of cloned repositories to improve the speed
 the system can checkout repositories.
 
 Shared DL_DIR
@@ -250,7 +250,7 @@ Deploying Yocto Autobuilder
 ===========================
 
 The most up to date information about how to setup and deploy your own
-Autbuilder can be found in README.md in the ``yocto-autobuilder2``
+Autobuilder can be found in README.md in the ``yocto-autobuilder2``
 repository.
 
 We hope that people can use the ``yocto-autobuilder2`` code directly but
diff --git a/documentation/toaster-manual/setup-and-use.rst b/documentation/toaster-manual/setup-and-use.rst
index ded771e79..e5f609558 100644
--- a/documentation/toaster-manual/setup-and-use.rst
+++ b/documentation/toaster-manual/setup-and-use.rst
@@ -362,7 +362,7 @@ Perform the following steps to install Toaster:
 
       /etc/httpd/conf.d/toaster.conf
 
-    If you are using OpenSUSE, put it here::
+    If you are using openSUSE, put it here::
 
       /etc/apache2/conf.d/toaster.conf
 
@@ -380,13 +380,13 @@ Perform the following steps to install Toaster:
             Require all granted
          </IfModule>
       </Directory>
-    
+
       <Directory /var/www/toaster/poky/bitbake/lib/toaster/toastermain>
          <Files "wsgi.py">
             Require all granted
          </Files>
       </Directory>
-    
+
       WSGIDaemonProcess toaster_wsgi python-path=/var/www/toaster/poky/bitbake/lib/toaster:/var/www/toaster/.local/lib/python3.4/site-packages
       WSGIScriptAlias / "/var/www/toaster/poky/bitbake/lib/toaster/toastermain/wsgi.py"
       <Location />
@@ -402,7 +402,7 @@ Perform the following steps to install Toaster:
       $ chmod +x bitbake/lib/toaster/toastermain/wsgi.py
 
     Finally, restart Apache to make sure all new configuration is loaded. For Ubuntu,
-    Debian, and OpenSUSE use::
+    Debian, and openSUSE use::
 
       $ sudo service apache2 restart
 
-- 
2.25.1

