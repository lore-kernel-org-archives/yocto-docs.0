Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91D1C44530
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 13:32:01 +0000 (UTC)
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11824.1769002317788260790
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 05:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.168, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dx4qJ1GgKz163;
	Wed, 21 Jan 2026 14:31:56 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dx4qH5HZzzKj;
	Wed, 21 Jan 2026 14:31:55 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 21 Jan 2026 14:31:43 +0100
Subject: [PATCH v2 02/12] sdk-manual: fix incorrect highlight language for
 console code-blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-code-block-misc-20260114-v2-2-fdd4bb5c2e68@cherry.de>
References: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
In-Reply-To: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Jan 2026 13:32:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8612

From: Quentin Schulz <quentin.schulz@cherry.de>

When unspecified in conf.py via the highlight_language variable (and
highlight variable for code-blocks), the lexer used for literal blocks
is "default" which tries to highlight the block as Python code.

These blocks aren't Python but simple command lines prefixed by a
prompt so let's use the "console" lexer to properly highlight.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/sdk-manual/appendix-customizing.rst |  4 +-
 documentation/sdk-manual/appendix-obtain.rst      | 28 ++++++--
 documentation/sdk-manual/extensible.rst           | 38 +++++++---
 documentation/sdk-manual/using.rst                |  8 ++-
 documentation/sdk-manual/working-projects.rst     | 84 +++++++++++++++++------
 5 files changed, 121 insertions(+), 41 deletions(-)

diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index e08630dce..e984b86bd 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -189,7 +189,9 @@ the installed SDKs to update the installed SDKs by using the
 #. Build the extensible SDK normally (i.e., use the
    ``bitbake -c populate_sdk_ext`` imagename command).
 
-#. Publish the SDK using the following command::
+#. Publish the SDK using the following command:
+
+   .. code-block:: console
 
       $ oe-publish-sdk some_path/sdk-installer.sh path_to_shared_http_directory
 
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 94c5552e5..9590cf95a 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -69,7 +69,9 @@ Follow these steps to locate and hand-install the toolchain:
 
 #. *Run the Installer:* Be sure you have execution privileges and run
    the installer. Here is an example from the ``Downloads``
-   directory::
+   directory:
+
+   .. code-block:: console
 
       $ ~/Downloads/poky-glibc-x86_64-core-image-sato-core2-64-qemux86-64-toolchain-&DISTRO;.sh
 
@@ -106,7 +108,9 @@ build the SDK installer. Follow these steps:
    the Source Directory (i.e. ``poky``), run the
    :ref:`structure-core-script` environment
    setup script to define the OpenEmbedded build environment on your
-   build host::
+   build host:
+
+   .. code-block:: console
 
       $ source oe-init-build-env
 
@@ -145,11 +149,15 @@ build the SDK installer. Follow these steps:
 
 #. *Build the SDK Installer:* To build the SDK installer for a standard
    SDK and populate the SDK image, use the following command form. Be
-   sure to replace ``image`` with an image (e.g. "core-image-sato")::
+   sure to replace ``image`` with an image (e.g. "core-image-sato"):
+
+   .. code-block:: console
 
       $ bitbake image -c populate_sdk
 
-   You can do the same for the extensible SDK using this command form::
+   You can do the same for the extensible SDK using this command form:
+
+   .. code-block:: console
 
       $ bitbake image -c populate_sdk_ext
 
@@ -174,7 +182,9 @@ build the SDK installer. Follow these steps:
          libc-staticdev"
 
 #. *Run the Installer:* You can now run the SDK installer from
-   ``tmp/deploy/sdk`` in the :term:`Build Directory`. Here is an example::
+   ``tmp/deploy/sdk`` in the :term:`Build Directory`. Here is an example:
+
+   .. code-block:: console
 
       $ cd poky/build/tmp/deploy/sdk
       $ ./poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
@@ -242,7 +252,9 @@ Follow these steps to extract the root filesystem:
    installed the toolchain (e.g. ``poky_sdk``).
 
    Here is an example based on the toolchain installed in the
-   ":ref:`sdk-manual/appendix-obtain:locating pre-built sdk installers`" section::
+   ":ref:`sdk-manual/appendix-obtain:locating pre-built sdk installers`" section:
+
+   .. code-block:: console
 
       $ source poky_sdk/environment-setup-core2-64-poky-linux
 
@@ -253,7 +265,9 @@ Follow these steps to extract the root filesystem:
    from a previously built root filesystem image that was downloaded
    from the :yocto_dl:`Index of Releases </releases/yocto/&DISTRO_REL_LATEST_TAG;/machines/>`.
    This command extracts the root filesystem into the ``core2-64-sato``
-   directory::
+   directory:
+
+   .. code-block:: console
 
       $ runqemu-extract-sdk ~/Downloads/core-image-sato-sdk-beaglebone-yocto.tar.bz2 ~/beaglebone-sato
 
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index fe5e4cdd5..808e076e6 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -71,7 +71,9 @@ Setting up the Extensible SDK environment directly in a Yocto build
 #. Set up all the needed layers and a Yocto :term:`Build Directory`, e.g. a regular Yocto
    build where ``bitbake`` can be executed.
 
-#. Run::
+#. Run:
+
+.. code-block:: console
 
       $ bitbake meta-ide-support
       $ bitbake -c populate_sysroot gtk+3
@@ -144,7 +146,9 @@ must be writable for whichever users need to use the SDK.
 The following command shows how to run the installer given a toolchain
 tarball for a 64-bit x86 development host system and a 64-bit x86 target
 architecture. The example assumes the SDK installer is located in
-``~/Downloads/`` and has execution rights::
+``~/Downloads/`` and has execution rights:
+
+.. code-block:: console
 
    $ ./Downloads/poky-glibc-x86_64-core-image-minimal-core2-64-toolchain-ext-2.5.sh
    Poky (Yocto Project Reference Distro) Extensible SDK installer version 2.5
@@ -194,7 +198,9 @@ begin with the string "``environment-setup``" and include as part of
 their name the tuned target architecture. As an example, the following
 commands set the working directory to where the SDK was installed and
 then source the environment setup script. In this example, the setup
-script is for an IA-based target machine using i586 tuning::
+script is for an IA-based target machine using i586 tuning:
+
+.. code-block:: console
 
    $ cd /home/scottrif/poky_sdk
    $ source environment-setup-core2-64-poky-linux
@@ -202,7 +208,9 @@ script is for an IA-based target machine using i586 tuning::
    Run devtool --help for further details.
 
 When using the environment script directly in a Yocto build, it can
-be run similarly::
+be run similarly:
+
+.. code-block:: console
 
    $ source tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux
 
@@ -272,7 +280,9 @@ populated on-demand. Sometimes you must explicitly install extra items
 into the SDK. If you need these extra items, you can first search for
 the items using the ``devtool search`` command. For example, suppose you
 need to link to libGL but you are not sure which recipe provides libGL.
-You can use the following command to find out::
+You can use the following command to find out:
+
+.. code-block:: console
 
    $ devtool search libGL mesa
    A free implementation of the OpenGL API
@@ -285,7 +295,9 @@ When using the extensible SDK directly in a Yocto build
 
 In this scenario, the Yocto build tooling, e.g. ``bitbake``
 is directly accessible to build additional items, and it
-can simply be executed directly::
+can simply be executed directly:
+
+.. code-block:: console
 
    $ bitbake curl-native
    # Add newly built native items to native sysroot
@@ -297,14 +309,16 @@ can simply be executed directly::
 When using a standalone installer for the Extensible SDK
 --------------------------------------------------------
 
-::
+.. code-block:: console
 
    $ devtool sdk-install mesa
 
 By default, the ``devtool sdk-install`` command assumes
 the item is available in pre-built form from your SDK provider. If the
 item is not available and it is acceptable to build the item from
-source, you can add the "-s" option as follows::
+source, you can add the "-s" option as follows:
+
+.. code-block:: console
 
    $ devtool sdk-install -s mesa
 
@@ -320,7 +334,9 @@ If you are working with an installed extensible SDK that gets
 occasionally updated (e.g. a third-party SDK), then you will need to
 manually "pull down" the updates into the installed SDK.
 
-To update your installed SDK, use ``devtool`` as follows::
+To update your installed SDK, use ``devtool`` as follows:
+
+.. code-block:: console
 
    $ devtool sdk-update
 
@@ -328,7 +344,9 @@ The previous command assumes your SDK provider has set the default update URL
 for you through the :term:`SDK_UPDATE_URL` variable as described in the
 ":ref:`sdk-manual/appendix-customizing:Providing Updates to the Extensible SDK After Installation`"
 section. If the SDK provider has not set that default URL, you need to
-specify it yourself in the command as follows::
+specify it yourself in the command as follows:
+
+.. code-block:: console
 
    $ devtool sdk-update path_to_update_directory
 
diff --git a/documentation/sdk-manual/using.rst b/documentation/sdk-manual/using.rst
index eced4a5c5..28f9e33b0 100644
--- a/documentation/sdk-manual/using.rst
+++ b/documentation/sdk-manual/using.rst
@@ -100,7 +100,9 @@ must be writable for whichever users need to use the SDK.
 The following command shows how to run the installer given a toolchain
 tarball for a 64-bit x86 development host system and a 64-bit x86 target
 architecture. The example assumes the SDK installer is located in
-``~/Downloads/`` and has execution rights::
+``~/Downloads/`` and has execution rights:
+
+.. code-block:: console
 
    $ ./Downloads/poky-glibc-x86_64-core-image-sato-i586-toolchain-&DISTRO;.sh
    Poky (Yocto Project Reference Distro) SDK installer version &DISTRO;
@@ -140,7 +142,9 @@ begin with the string "``environment-setup``" and include as part of
 their name the tuned target architecture. As an example, the following
 commands set the working directory to where the SDK was installed and
 then source the environment setup script. In this example, the setup
-script is for an IA-based target machine using i586 tuning::
+script is for an IA-based target machine using i586 tuning:
+
+.. code-block:: console
 
    $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index 7df73b1b1..ceae1fedd 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -33,7 +33,9 @@ project:
 
 #. *Create a Working Directory and Populate It:* Create a clean
    directory for your project and then make that directory your working
-   location::
+   location:
+
+   .. code-block:: console
 
       $ mkdir $HOME/helloworld
       $ cd $HOME/helloworld
@@ -45,7 +47,9 @@ project:
    respectively.
 
    Use the following command to create an empty README file, which is
-   required by GNU Coding Standards::
+   required by GNU Coding Standards:
+
+   .. code-block:: console
 
       $ touch README
 
@@ -84,17 +88,23 @@ project:
    which is followed by the string "poky-linux". For this example, the
    command sources a script from the default SDK installation directory
    that uses the 32-bit Intel x86 Architecture and the &DISTRO; Yocto
-   Project release::
+   Project release:
+
+   .. code-block:: console
 
       $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
    Another example is sourcing the environment setup directly in a Yocto
-   build::
+   build:
+
+   .. code-block:: console
 
       $ source tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux
 
 #. *Create the configure Script:* Use the ``autoreconf`` command to
-   generate the ``configure`` script::
+   generate the ``configure`` script:
+
+   .. code-block:: console
 
       $ autoreconf
 
@@ -113,7 +123,9 @@ project:
    the cross-compiler. The
    :term:`CONFIGURE_FLAGS`
    environment variable provides the minimal arguments for GNU
-   configure::
+   configure:
+
+   .. code-block:: console
 
       $ ./configure ${CONFIGURE_FLAGS}
 
@@ -126,12 +138,16 @@ project:
    ``armv5te-poky-linux-gnueabi``. You will notice that the name of the
    script is ``environment-setup-armv5te-poky-linux-gnueabi``. Thus, the
    following command works to update your project and rebuild it using
-   the appropriate cross-toolchain tools::
+   the appropriate cross-toolchain tools:
+
+   .. code-block:: console
 
      $ ./configure --host=armv5te-poky-linux-gnueabi --with-libtool-sysroot=sysroot_dir
 
 #. *Make and Install the Project:* These two commands generate and
-   install the project into the destination directory::
+   install the project into the destination directory:
+
+   .. code-block:: console
 
       $ make
       $ make install DESTDIR=./tmp
@@ -146,13 +162,17 @@ project:
    This next command is a simple way to verify the installation of your
    project. Running the command prints the architecture on which the
    binary file can run. This architecture should be the same
-   architecture that the installed cross-toolchain supports::
+   architecture that the installed cross-toolchain supports:
+
+   .. code-block:: console
 
       $ file ./tmp/usr/local/bin/hello
 
 #. *Execute Your Project:* To execute the project, you would need to run
    it on your target hardware. If your target hardware happens to be
-   your build host, you could run the project as follows::
+   your build host, you could run the project as follows:
+
+   .. code-block:: console
 
       $ ./tmp/usr/local/bin/hello
 
@@ -198,7 +218,9 @@ regarding variable behavior:
 .. note::
 
    Regardless of how you set your variables, if you use the "-e" option
-   with ``make``, the variables from the SDK setup script take precedence::
+   with ``make``, the variables from the SDK setup script take precedence:
+
+   .. code-block:: console
 
       $ make -e target
 
@@ -209,7 +231,9 @@ demonstrates these variable behaviors.
 In a new shell environment variables are not established for the SDK
 until you run the setup script. For example, the following commands show
 a null value for the compiler variable (i.e.
-:term:`CC`)::
+:term:`CC`):
+
+.. code-block:: console
 
    $ echo ${CC}
 
@@ -219,7 +243,9 @@ Running the
 SDK setup script for a 64-bit build host and an i586-tuned target
 architecture for a ``core-image-sato`` image using the current &DISTRO;
 Yocto Project release and then echoing that variable shows the value
-established through the script::
+established through the script:
+
+.. code-block:: console
 
    $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
    $ echo ${CC}
@@ -230,7 +256,9 @@ example:
 
 #. *Create a Working Directory and Populate It:* Create a clean
    directory for your project and then make that directory your working
-   location::
+   location:
+
+   .. code-block:: console
 
       $ mkdir $HOME/helloworld
       $ cd $HOME/helloworld
@@ -276,12 +304,16 @@ example:
    which is followed by the string "poky-linux". For this example, the
    command sources a script from the default SDK installation directory
    that uses the 32-bit Intel x86 Architecture and the &DISTRO_NAME; Yocto
-   Project release::
+   Project release:
+
+   .. code-block:: console
 
       $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
    Another example is sourcing the environment setup directly in a Yocto
-   build::
+   build:
+
+   .. code-block:: console
 
       $ source tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux
 
@@ -306,7 +338,9 @@ example:
 #. *Make the Project:* Use the ``make`` command to create the binary
    output file. Because variables are commented out in the Makefile, the
    value used for :term:`CC` is the value set when the SDK environment setup
-   file was run::
+   file was run:
+
+   .. code-block:: console
 
       $ make
       i586-poky-linux-gcc -m32 -march=i586 --sysroot=/opt/poky/2.5/sysroots/i586-poky-linux -I . -c main.c
@@ -319,7 +353,9 @@ example:
 
    You can override the :term:`CC` environment variable with the same
    variable as set from the Makefile by uncommenting the line in the
-   Makefile and running ``make`` again::
+   Makefile and running ``make`` again:
+
+   .. code-block:: console
 
       $ make clean
       rm -rf *.o
@@ -340,7 +376,9 @@ example:
    variable as part of the command line. Go into the Makefile and
    re-insert the comment character so that running ``make`` uses the
    established SDK compiler. However, when you run ``make``, use a
-   command-line argument to set :term:`CC` to "gcc"::
+   command-line argument to set :term:`CC` to "gcc":
+
+   .. code-block:: console
 
       $ make clean
       rm -rf *.o
@@ -364,7 +402,9 @@ example:
    environment variable.
 
    In this last case, edit Makefile again to use the "gcc" compiler but
-   then use the "-e" option on the ``make`` command line::
+   then use the "-e" option on the ``make`` command line:
+
+   .. code-block:: console
 
       $ make clean
       rm -rf *.o
@@ -389,7 +429,9 @@ example:
    Makefile.
 
 #. *Execute Your Project:* To execute the project (i.e. ``target_bin``),
-   use the following command::
+   use the following command:
+
+   .. code-block:: console
 
       $ ./target_bin
       Hello World!

-- 
2.52.0


