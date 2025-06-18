Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8C5C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 15:14:04 +0000 (UTC)
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
 by mx.groups.io with SMTP id smtpd.web10.1411.1750259640681128327
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 08:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.175, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bMnMC1vkSz5Cc;
	Wed, 18 Jun 2025 17:13:59 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bMnMB688cztsc;
	Wed, 18 Jun 2025 17:13:58 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 18 Jun 2025 17:13:35 +0200
Subject: [PATCH 1/2] tree-wide: make the :doc: directive use absolute paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-doc-abs-path-v1-1-9f62e0ac92d2@cherry.de>
References: <20250618-doc-abs-path-v1-0-9f62e0ac92d2@cherry.de>
In-Reply-To: <20250618-doc-abs-path-v1-0-9f62e0ac92d2@cherry.de>
To: docs@lists.yoctoproject.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 15:14:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7103

From: Quentin Schulz <quentin.schulz@cherry.de>

This makes all :doc: directives use an absolute paths (with the root
directory being documentation/ in the repo).

This is then consistent across the whole source and is easier to review
and move files around, you just need to know where a file is located
relative to documentation/ directory and use that.

This gets rid of paths looking in parent directory with '..' as well as
expecting a file to be in the same directory as the other file it points
to via the :doc: directive.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/bsp-guide/bsp.rst                           | 4 ++--
 documentation/contributor-guide/submit-changes.rst        | 4 ++--
 documentation/dev-manual/building.rst                     | 4 ++--
 documentation/dev-manual/debugging.rst                    | 4 ++--
 documentation/dev-manual/new-recipe.rst                   | 2 +-
 documentation/dev-manual/start.rst                        | 2 +-
 documentation/dev-manual/vulnerabilities.rst              | 2 +-
 documentation/migration-guides/release-notes-4.3.rst      | 4 ++--
 documentation/overview-manual/development-environment.rst | 6 +++---
 documentation/ref-manual/resources.rst                    | 4 ++--
 documentation/ref-manual/system-requirements.rst          | 2 +-
 documentation/ref-manual/variables.rst                    | 2 +-
 documentation/transitioning-to-a-custom-environment.rst   | 4 ++--
 documentation/what-i-wish-id-known.rst                    | 4 ++--
 14 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 35972f1726986a1366683674c3af3d1dfb8e0a65..92e3a6e1c80f84899f8cd44fa53b0a5590e0d314 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -876,7 +876,7 @@ The requirements for a released BSP that conform to the Yocto Project are:
    ``recipes-*`` subdirectories specific to the recipe's function, or
    within a subdirectory containing a set of closely-related recipes.
    The recipes themselves should follow the general guidelines for
-   recipes found in the ":doc:`../contributor-guide/recipe-style-guide`"
+   recipes found in the ":doc:`/contributor-guide/recipe-style-guide`"
    in the Yocto Project and OpenEmbedded Contributor Guide.
 
 -  *License File:* You must include a license file in the
@@ -910,7 +910,7 @@ The requirements for a released BSP that conform to the Yocto Project are:
    -  The name and contact information for the BSP layer maintainer.
       This is the person to whom patches and questions should be sent.
       For information on how to find the right person, see the
-      :doc:`../contributor-guide/submit-changes` section in the Yocto Project and
+      :doc:`/contributor-guide/submit-changes` section in the Yocto Project and
       OpenEmbedded Contributor Guide.
 
    -  Instructions on how to build the BSP using the BSP layer.
diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 6d5d69d7cfb45b5618e24c345b226f0495b116ef..adb78fa08d8ec783ccdabff41a3ea69f16e7e3a0 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -76,7 +76,7 @@ Clone the Git repository for the component to modify
 ----------------------------------------------------
 
 After identifying the component to modify as described in the
-":doc:`../contributor-guide/identify-component`" section, clone the
+":doc:`/contributor-guide/identify-component`" section, clone the
 corresponding Git repository. Here is an example for OpenEmbedded-Core::
 
   git clone https://git.openembedded.org/openembedded-core
@@ -872,7 +872,7 @@ in regards to the use of generative AI tools. See:
 https://www.linuxfoundation.org/legal/generative-ai.
 
 All of the existing guidelines in this document are expected to be followed,
-including in the :doc:`recipe-style-guide`, and contributing the changes with
+including in the :doc:`/contributor-guide/recipe-style-guide`, and contributing the changes with
 additional requirements to the items in section
 :ref:`contributor-guide/submit-changes:Implement and commit changes`.
 
diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 807c665f68dce61440cb8116b82714df71c41193..865d2e1b672284db6563f7b56fdc6b94b7958522 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -48,7 +48,7 @@ The following figure and list overviews the build process:
    :width: 100%
 
 #. *Set up Your Host Development System to Support Development Using the
-   Yocto Project*: See the ":doc:`start`" section for options on how to get a
+   Yocto Project*: See the ":doc:`/dev-manual/start`" section for options on how to get a
    build host ready to use the Yocto Project.
 
 #. *Initialize the Build Environment:* Initialize the build environment
@@ -113,7 +113,7 @@ The following figure and list overviews the build process:
 Building Images for Multiple Targets Using Multiple Configurations
 ==================================================================
 
-See the :doc:`multiconfig` section of the Yocto Project Development Tasks
+See the :doc:`/dev-manual/multiconfig` section of the Yocto Project Development Tasks
 Manual.
 
 Building an Initial RAM Filesystem (Initramfs) Image
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 8552b26aea9059446b5b4346ae7ef1f84e5750c1..6c45ccf652793b9697da75efb015d6d56cabe124 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -890,7 +890,7 @@ The build should work without issue.
 As with all solved problems, if they originated upstream, you need to
 submit the fix for the recipe in OE-Core and upstream so that the
 problem is taken care of at its source. See the
-":doc:`../contributor-guide/submit-changes`" section for more information.
+":doc:`/contributor-guide/submit-changes`" section for more information.
 
 Debugging With the GNU Project Debugger (GDB) Remotely
 ======================================================
@@ -1261,7 +1261,7 @@ Here are some other tips that you might find useful:
    :yocto_bugs:`Bugzilla <>`. For information on
    how to submit a bug against the Yocto Project, see the Yocto Project
    Bugzilla :yocto_wiki:`wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
-   and the ":doc:`../contributor-guide/report-defect`" section.
+   and the ":doc:`/contributor-guide/report-defect`" section.
 
    .. note::
 
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 9792bd4c1f647e6186ae74890b32c493eeef3f9c..c49881efe63f74da5205d1af47ddde1c9c69aa48 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1401,7 +1401,7 @@ Following Recipe Style Guidelines
 =================================
 
 When writing recipes, it is good to conform to existing style guidelines.
-See the ":doc:`../contributor-guide/recipe-style-guide`" in the Yocto Project
+See the ":doc:`/contributor-guide/recipe-style-guide`" in the Yocto Project
 and OpenEmbedded Contributor Guide for reference.
 
 It is common for existing recipes to deviate a bit from this style.
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 73548132a3ff223803a9553b1a0463a521e46fcd..d77da04276bfd03002cbd3497adf4d008c37df58 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -234,7 +234,7 @@ particular working environment and set of practices.
     -  The Yocto Project community encourages you to send patches to the
        project to fix bugs or add features. If you do submit patches,
        follow the project commit guidelines for writing good commit
-       messages. See the ":doc:`../contributor-guide/submit-changes`"
+       messages. See the ":doc:`/contributor-guide/submit-changes`"
        section in the Yocto Project and OpenEmbedded Contributor Guide.
 
     -  Send changes to the core sooner than later as others are likely
diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index d901ff975bf7e2cd5f6785e5794a9893a275f696..5331a639919c7d3e52dfe46accaf2a4daa1f7fc2 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -22,7 +22,7 @@ issues may be impacting Poky and OE-Core. It is up to the maintainers, users,
 contributors and anyone interested in the issues to investigate and possibly fix them by
 updating software components to newer versions or by applying patches to address them.
 It is recommended to work with Poky and OE-Core upstream maintainers and submit
-patches to fix them, see ":doc:`../contributor-guide/submit-changes`" for details.
+patches to fix them, see ":doc:`/contributor-guide/submit-changes`" for details.
 
 Vulnerability check at build time
 =================================
diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 0103ac985ef1ddf6c0722ff118a1967367263881..aa3f31a2ce47792cb923edf8eaf9abcd70cba69d 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -272,9 +272,9 @@ New Features / Enhancements in 4.3
 
 -  Prominent documentation updates:
 
-   -  New :doc:`../contributor-guide/index` document.
+   -  New :doc:`/contributor-guide/index` document.
 
-   -  New :doc:`../dev-manual/security-subjects` chapter in the Development
+   -  New :doc:`/dev-manual/security-subjects` chapter in the Development
       Tasks Manual.
 
    -  Long overdue documentation for the :ref:`ref-classes-devicetree` class.
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index d79173ff55066ff163d09ad955eeee44bdb64287..066d784314cf66190bce733c27fffdc74eee5bac 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -240,7 +240,7 @@ and so forth.
 
    For information on finding out who is responsible for (maintains) a
    particular area of code in the Yocto Project, see the
-   ":doc:`../contributor-guide/identify-component`"
+   ":doc:`/contributor-guide/identify-component`"
    section of the Yocto Project and OpenEmbedded Contributor Guide.
 
 The Yocto Project ``poky`` Git repository also has an upstream
@@ -272,7 +272,7 @@ push them into the "contrib" area and subsequently request that the
 maintainer include them into an upstream branch. This process is called
 "submitting a patch" or "submitting a change." For information on
 submitting patches and changes, see the
-":doc:`../contributor-guide/submit-changes`" section in the Yocto Project
+":doc:`/contributor-guide/submit-changes`" section in the Yocto Project
 and OpenEmbedded Contributor Guide.
 
 In summary, there is a single point of entry for changes into the
@@ -347,7 +347,7 @@ Book <https://book.git-scm.com>`__.
    this type of change, you format the patch and then send the email
    using the Git commands ``git format-patch`` and ``git send-email``.
    For information on how to use these scripts, see the
-   ":doc:`../contributor-guide/submit-changes`" section in the Yocto Project
+   ":doc:`/contributor-guide/submit-changes`" section in the Yocto Project
    and OpenEmbedded Contributor Guide.
 
 Git
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 4eaaca942ec3c46968bbc6eb514042f09d5f37a3..bcbc7ebacac89fd49179efef03a3f561fb9396fd 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -23,7 +23,7 @@ The Yocto Project gladly accepts contributions. You can submit changes
 to the project either by creating and sending pull requests, or by
 submitting patches through email. For information on how to do both as
 well as information on how to identify the maintainer for each area of
-code, see the :doc:`../contributor-guide/index`.
+code, see the :doc:`/contributor-guide/index`.
 
 .. _resources-bugtracker:
 
@@ -45,7 +45,7 @@ your expectations).
 For a general procedure and guidelines on how to use Bugzilla to submit a bug
 against the Yocto Project, see the following:
 
--  The ":doc:`../contributor-guide/report-defect`"
+-  The ":doc:`/contributor-guide/report-defect`"
    section in the Yocto Project and OpenEmbedded Contributor Guide.
 
 -  The Yocto Project :yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index b64a13320a148d494dac2df3f82cd7c70dae5e05..14b635013bc64ce6d53ab0334fd0a2718764a0d7 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -145,7 +145,7 @@ tested on former revisions of "&DISTRO_NAME;", but no longer are:
       interested in hearing about your experience. For information on
       how to submit a bug, see the Yocto Project
       :yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
-      and the ":doc:`../contributor-guide/report-defect`"
+      and the ":doc:`/contributor-guide/report-defect`"
       section in the Yocto Project and OpenEmbedded Contributor Guide.
 
 Required Packages for the Build Host
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5c18b852d19e8e181eac4b33f10e43279b3068c2..5ed594c776db9cd993ae85f5187fa53b071087d2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2576,7 +2576,7 @@ system and gives an overview of their function and contents.
       You can safely share this directory between multiple builds on the
       same development machine. For additional information on how the build
       process gets source files when working behind a firewall or proxy
-      server, see this specific question in the ":doc:`faq`"
+      server, see this specific question in the ":doc:`/ref-manual/faq`"
       chapter. You can also refer to the
       ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"
       Wiki page.
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index 6ff55e56191b49a22ccfe346371735df9f7819fe..a5f55c567acffbe46a3096c31c0d02be798048d7 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -8,8 +8,8 @@ Transitioning to a custom environment for systems development
 
 .. note::
 
-   So you've finished the :doc:`brief-yoctoprojectqs/index` and
-   glanced over the document :doc:`what-i-wish-id-known`, the latter contains
+   So you've finished the :doc:`/brief-yoctoprojectqs/index` and
+   glanced over the document :doc:`/what-i-wish-id-known`, the latter contains
    important information learned from other users. You're well prepared. But
    now, as you are starting your own project, it isn't exactly straightforward what
    to do. And, the documentation is daunting. We've put together a few hints to
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index 836097910d29439249ebfaba49af75b8d6d4948c..ddee6ad7498a0173f79b50c16869f8cae001a92c 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -49,7 +49,7 @@ contact us with other suggestions.
    their silicon. These layers have names such as "meta-intel" or "meta-ti". Try
    not to build layers from scratch. If you do have custom silicon, use one of
    these layers as a guide or template and familiarize yourself with the
-   :doc:`bsp-guide/index`.
+   :doc:`/bsp-guide/index`.
 
 #. **Do not put everything into one layer:**
    Use different layers to logically separate information in your build. As an
@@ -127,7 +127,7 @@ contact us with other suggestions.
    You can build and run a specific task for a specific package (including
    devshell) or even a single recipe. When developers first start using the
    Yocto Project, the instructions found in the
-   :doc:`brief-yoctoprojectqs/index` show how to create an image
+   :doc:`/brief-yoctoprojectqs/index` show how to create an image
    and then run or flash that image.  However, you can actually build just a
    single recipe. Thus, if some dependency or recipe isn't working, you can just
    say "bitbake foo" where "foo" is the name for a specific recipe.  As you

-- 
2.49.0


