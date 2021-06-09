Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.8932.1623250057070769151
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 07:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 052B6100009;
	Wed,  9 Jun 2021 14:47:34 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH v3] test-manual: add initial reproducible builds documentation
Date: Wed,  9 Jun 2021 16:47:28 +0200
Message-Id: <20210609144728.103458-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1686F0ED5A1183FF.18579@lists.yoctoproject.org>
References: <1686F0ED5A1183FF.18579@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reviewed-by: Quentin Schulz <foss@0leil.net>
---
 documentation/test-manual/index.rst           |   1 +
 .../test-manual/reproducible-builds.rst       | 134 ++++++++++++++++++
 2 files changed, 135 insertions(+)
 create mode 100644 documentation/test-manual/reproducible-builds.rst

diff --git a/documentation/test-manual/index.rst b/documentation/test-manual/index.rst
index e2198c4c39..d122b5e270 100644
--- a/documentation/test-manual/index.rst
+++ b/documentation/test-manual/index.rst
@@ -13,6 +13,7 @@ Yocto Project Test Environment Manual
    intro
    test-process
    understand-autobuilder
+   reproducible-builds
    history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
new file mode 100644
index 0000000000..f8140d7890
--- /dev/null
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -0,0 +1,134 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+*******************
+Reproducible Builds
+*******************
+
+================
+How we define it
+================
+
+The Yocto Project defines reproducibility as where a given input build
+configuration will give the same binary output regardless of when it is built
+(now or in 5 years time), regardless of the path on the filesystem the build is
+run in, and regardless of the distro and tools on the underlying host system the
+build is running on.
+
+==============
+Why it matters
+==============
+
+The project aligns with the `Reproducible Builds project
+<https://reproducible-builds.org/>`_, which shares information about why
+reproducibility matters. The primary focus of the project is the ability to
+detect security issues being introduced. However, from a Yocto Project
+perspective, it is also hugely important that our builds are deterministic. When
+you build a given input set of metadata, we expect you to get consistent output.
+This has always been a key focus but, since release 3.1 ("dunfell"), it is now true
+down to the binary level including timestamps.
+
+For example, at some point in the future life of a product, you find that you
+need to rebuild to add a security fix. If this happens, only the components that
+have been modified should change at the binary level. This would lead to much
+easier and clearer bounds on where validation is needed.
+
+This also gives an additional benefit to the project builds themselves, our hash
+equivalence for :ref:`Shared State <overview-manual/concepts:Shared State>`
+object reuse works much more effectively when the binary output remains the
+same.
+
+.. note::
+
+   We strongly advise you to make sure your project builds reproducibly
+   before finalizing your production images. It would be too late if you
+   only address this issue when the first updates are required.
+
+===================
+How we implement it
+===================
+
+There are many different aspects to build reproducibility, but some particular
+things we do within the build system to ensure reproducibility include:
+
+-  Adding mappings to the compiler options to ensure debug filepaths are mapped
+   to consistent target compatible paths. This is done through the
+   ``DEBUG_PREFIX_MAP`` variable which sets the ``-fmacro-prefix-map`` and
+   ``-fdebug-prefix-map`` compiler options correctly to map to target paths.
+-  Being explicit about recipe dependencies and their configuration (no floating
+   configure options or host dependencies creeping in). In particular this means
+   making sure :term:`PACKAGECONFIG` coverage covers configure options which may
+   otherwise try and auto-detect host dependencies.
+-  Using recipe specific sysroots to isolate recipes so they only see their
+   dependencies. These are visible as ``recipe-sysroot`` and
+   ``recipe-sysroot-native`` directories within the :term:`WORKDIR` of a given
+   recipe and are populated only with the dependencies a recipe has.
+-  Build images from a reduced package set: only packages from recipes the image
+   depends upon.
+-  Filtering the tools available from the host's ``PATH`` to only a specific set
+   of tools, set using the :term:`HOSTTOOLS` variable.
+
+=========================================
+Can we prove the project is reproducible?
+=========================================
+
+Yes, we can prove it and we regularly test this on the Autobuilder. At the
+time of writing (release 3.3, "hardknott"), :term:`OpenEmbedded-Core (OE-Core)`
+is 100% reproducible for all its recipes (i.e. world builds) apart from the Go
+language and Ruby documentation packages. Unfortunately, the current
+implementation of the Go language has fundamental reproducibility problems as
+it always depends upon the paths it is built in.
+
+.. note::
+
+   Only BitBake and :term:`OpenEmbedded-Core (OE-Core)`, which is the ``meta``
+   layer in Poky, guarantee complete reproducibility. The moment you add
+   another layer, this warranty is voided, because of additional configuration
+   files, ``bbappend`` files, overridden classes, etc.
+
+To run our automated selftest, as we use in our CI on the Autobuilder, you can
+run::
+
+   oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
+
+This defaults to including a ``world`` build so, if other layers are added, it would
+also run the tests for recipes in the additional layers. The first build will be
+run using :ref:`Shared State <overview-manual/concepts:Shared State>` if
+available, the second build explicitly disables
+:ref:`Shared State <overview-manual/concepts:Shared State>` and builds on the
+specific host the build is running on. This means we can test reproducibility
+builds between different host distributions over time on the Autobuilder.
+
+If ``OEQA_DEBUGGING_SAVED_OUTPUT`` is set, any differing packages will be saved
+here. The test is also able to run the ``diffoscope`` command on the output to
+generate HTML files showing the differences between the packages, to aid
+debugging. On the Autobuilder, these appear under
+https://autobuilder.yocto.io/pub/repro-fail/ in the form ``oe-reproducible +
+<date> + <random ID>``, e.g. ``oe-reproducible-20200202-1lm8o1th``.
+
+The project's current reproducibility status can be seen at
+https://www.yoctoproject.org/reproducible-build-results/
+
+You can also check the reproducibility status on supported host distributions:
+
+-  CentOS: https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-centos
+-  Debian: https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-debian
+-  Fedora: https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-fedora
+-  Ubuntu: https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-ubuntu
+
+===============================
+Can I test my layer or recipes?
+===============================
+
+Once again, you can run a ``world`` test using the
+:ref:`oe-selftest <ref-manual/release-process:Testing and Quality Assurance>`
+command provided above. This functionality is implemented
+in `meta/lib/oeqa/selftest/cases/reproducible.py
+<https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`_.
+
+You could subclass the test and change ``targets`` to a different target.
+
+You may also change ``sstate_targets`` which would allow you to "pre-cache" some
+set of recipes before the test, meaning they are excluded from reproducibility
+testing. As a practical example, you could set ``sstate_targets`` to
+``core-image-sato``, then setting ``targets`` to ``core-image-sato-sdk`` would
+run reproducibility tests only on the targets belonging only to ``core-image-sato-sdk``.
-- 
2.25.1

