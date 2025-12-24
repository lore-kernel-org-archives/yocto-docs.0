Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF65BE776E7
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123726.1766593924249012651
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fzXKA3pg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B83401A23E4
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EB866073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE98610AB1379;
	Wed, 24 Dec 2025 17:32:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593922; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nIsvwk4n7TfBSPYFf6BgN3riN2MKZUrIYw+S5aWA66c=;
	b=fzXKA3pgz5pAm3zLuU2HueFkVKzWeVujqbvlbrBlU2zZf3EukNRWIsldhKGQ68ovnsMhX6
	mU8e8PTakqjYBsjKkdX1maFVhlmoxbRHljzHa76gIp+3BeA0aBdLH9s8wlTOxqw1CSwTCP
	ZsLDqF7ngKAsRofG01LlcxPEqhLMgS3tkfgN0QcqC+Z+Ibvrd6a0FsaEILffOzmi4lqJlw
	DTqHdvYze0CQ8hNDbVwukneea/qnQxcU8fIWil9H99fVoyFCby19+hGoEJP7+Y5CikOprC
	AjsGtMxn1X3666ABv3UUAljgXfdAfWZeYevhyLG1AoCL7GV3lIP6sAW8FGxlSw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:48 +0100
Subject: [PATCH 22/53] overview-manual/development-environment.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-22-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10935;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=FWHWqb3P74YB6mGKNaGisndTENkIhsfCaLpjIHcGFSI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVqaJqEhXRpI5wWt7QRM6GsBj8W8hB87i+wI
 Acp0tkLh12JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVagAKCRDRgEFAKaOo
 NseCEACbn476AvJPsCEiQIOYRbbWGHzywQ/lmS6nUw9CkAMXtyuis9mi1OOnJFbKTbVXsRrVntZ
 W4r0BNy3AkSSbPxJJq3/5eEVwo7HcoQfB63LaBxPEtZlFYLOFHb1MFln2/Z3p3ezJbrLNqaWglW
 nqdugM4kM3bYne0qnVcGIbuSmCq0FDMfUX/uCJjlU+rmzpQdo8D6+y/whOldtUWoZwuMt0VeCG9
 oIX4v9/cUO4gUlCfsaVblmBeiB5UChRJicKpcoz9RbRm6c8ECDbzTGQlteTsKEtHgGUKCyfvTeT
 gySr0UU+s0eD5CcQep2OcXlwt3pvYho8UphAMHYBYNJn4vv5TXAWWABYww28J134difrCp9fGVe
 0ho3HVah9NPuZpVIpN9UDJ3MDRA5FNP2qxYU7Ovp1kwPnBA+hIAOeAHGL8cmhzaExqLk6+uszj5
 p0EwC1t0fgsVU5Ph4uStKtO1xgF4PdjxWD40QoNyA5TEkat0ZwoupEnC1e/w7+H7WO89EFL7i+6
 +weNjHtTMDzb/99La4QQ3wZ9p35/VL49UJqosdv6sBKJIYncrkczF2ouxIJkawEHlNxW4r8AaNi
 LBtQ2WLCA1FnvRFsQBgXwzVs5DLMCdPEXV1psZv63rAnxJ14JVMQJanU/runsYNgfGbT61sKMww
 zLzHBNA3sB0Cz9Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8351

Remove references to the Poky repository, replace by OpenEmbedded-Core.
Replace the poky examples for the Git section by yocto-docs.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../overview-manual/development-environment.rst    | 74 ++++++++++------------
 1 file changed, 35 insertions(+), 39 deletions(-)

diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index ab9bd084c..7eb57f12f 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -148,38 +148,35 @@ code browser is organized into categories by function such as IDE
 Plugins, Matchbox, Poky, Yocto Linux Kernel, and so forth. From the
 interface, you can click on any particular item in the "Name" column and
 see the URL at the bottom of the page that you need to clone a Git
-repository for that particular item. Having a local Git repository of
-the :term:`Source Directory`, which
-is usually named "poky", allows you to make changes, contribute to the
+repository for that particular item. Having a local Git clones of
+these repositories allows you to make changes, contribute to the
 history, and ultimately enhance the Yocto Project's tools, Board Support
 Packages, and so forth.
 
 For any supported release of Yocto Project, you can also go to the
 :yocto_home:`Yocto Project Website <>` and select the "DOWNLOADS"
-item from the "SOFTWARE" menu and get a released tarball of the ``poky``
-repository, any supported BSP tarball, or Yocto Project tools. Unpacking
+item from the "SOFTWARE" menu and get a released tarball of the
+repositories, any supported BSP tarball, or Yocto Project tools. Unpacking
 these tarballs gives you a snapshot of the released files.
 
 .. note::
 
    -  The recommended method for setting up the Yocto Project
-      :term:`Source Directory` and the files
-      for supported BSPs (e.g., ``meta-intel``) is to use
-      :ref:`overview-manual/development-environment:git`
+      is to use :ref:`overview-manual/development-environment:git`
       to create a local copy of the upstream repositories.
 
    -  Be sure to always work in matching branches for both the selected
-      BSP repository and the Source Directory (i.e. ``poky``)
-      repository. For example, if you have checked out the "&DISTRO_NAME_NO_CAP;"
-      branch of ``poky`` and you are going to use ``meta-intel``, be
+      BSP repository and the :term:`OpenEmbedded-Core (OE-Core)` and
+      :term:`BitBake` repositories. For example, if you have checked out the "&DISTRO_NAME_NO_CAP;"
+      branch of :term:`OpenEmbedded-Core (OE-Core)` and you are going to use ``meta-intel``, be
       sure to checkout the "&DISTRO_NAME_NO_CAP;" branch of ``meta-intel``.
 
 In summary, here is where you can get the project files needed for
 development:
 
--  :yocto_git:`Source Repositories: <>` This area contains Poky, Yocto
-   documentation, metadata layers, and Linux kernel. You can create local
-   copies of Git repositories for each of these areas.
+-  :yocto_git:`Source Repositories: <>` This area contains ``meta-yocto``, Yocto
+   documentation, metadata layers. You can create local copies of Git
+   repositories for each of these areas.
 
    .. image:: figures/source-repos.png
       :width: 100%
@@ -230,11 +227,11 @@ and so forth.
    ":doc:`/contributor-guide/identify-component`"
    section of the Yocto Project and OpenEmbedded Contributor Guide.
 
-The Yocto Project ``poky`` Git repository also has an upstream
-contribution Git repository named ``poky-contrib``. You can see all the
+The Yocto Project Git repositories may also have an upstream
+contribution Git repository suffixed with ``-contrib``. You can see all the
 branches in this repository using the web interface of the
-:yocto_git:`Source Repositories <>` organized within the "Poky Support"
-area. These branches hold changes (commits) to the project that have
+:yocto_git:`Source Repositories <>`.
+These branches hold changes (commits) to the project that have
 been submitted or committed by the Yocto Project development team and by
 community members who contribute to the project. The maintainer
 determines if the changes are qualified to be moved from the "contrib"
@@ -323,7 +320,7 @@ Book <https://book.git-scm.com>`__.
    software on which to develop. The Yocto Project has two scripts named
    ``create-pull-request`` and ``send-pull-request`` that ship with the
    release to facilitate this workflow. You can find these scripts in
-   the ``scripts`` folder of the :term:`Source Directory`. For information
+   the ``scripts`` folder of :term:`OpenEmbedded-Core (OE-Core)`. For information
    on how to use these scripts, see the
    ":ref:`contributor-guide/submit-changes:using scripts to push a change upstream and request a pull`"
    section in the Yocto Project and OpenEmbedded Contributor Guide.
@@ -377,7 +374,7 @@ local experimentation on projects as you develop changes or new
 features.
 
 A Git repository represents all development efforts for a given project.
-For example, the Git repository ``poky`` contains all changes and
+For example, the Git repository :yocto_git:`yocto-docs </yocto-docs>` contains all changes and
 developments for that repository over the course of its entire life.
 That means that all changes that make up all releases are captured. The
 repository maintains a complete history of changes.
@@ -390,10 +387,10 @@ locally.
 
 It is important to understand that Git tracks content change and not
 files. Git uses "branches" to organize different development efforts.
-For example, the ``poky`` repository has several branches that include
+For example, the :yocto_git:`yocto-docs </yocto-docs>` repository has several branches that include
 the current "&DISTRO_NAME_NO_CAP;" branch, the "master" branch, and many
 branches for past Yocto Project releases. You can see all the branches
-by going to :yocto_git:`/poky/` and clicking on the
+by going to :yocto_git:`yocto-docs </yocto-docs/>` and clicking on the
 ``[...]`` link beneath the "Branch" heading.
 
 Each of these branches represents a specific area of development. The
@@ -409,15 +406,15 @@ development branch in the repository. To help illustrate, consider the
 following example Git commands::
 
    $ cd ~
-   $ git clone git://git.yoctoproject.org/poky -b &DISTRO_NAME_NO_CAP;
+   $ git clone git://git.yoctoproject.org/yocto-docs -b &DISTRO_NAME_NO_CAP;
 
 In the previous example
 after moving to the home directory, the ``git clone`` command creates a
-local copy of the upstream ``poky`` Git repository and checks out a
+local copy of the upstream ``yocto-docs`` Git repository and checks out a
 local branch named "&DISTRO_NAME_NO_CAP;", which tracks the upstream
 "origin/&DISTRO_NAME_NO_CAP;" branch. Changes you make while in this
 branch would ultimately affect the upstream "&DISTRO_NAME_NO_CAP;" branch
-of the ``poky`` repository.
+of the ``yocto-docs`` repository.
 
 It is important to understand that when you create and checkout a local
 working branch based on a branch name, your local environment matches
@@ -432,13 +429,12 @@ Yocto Project Release.
 Git uses "tags" to mark specific changes in a repository branch
 structure. Typically, a tag is used to mark a special point such as the
 final change (or commit) before a project is released. You can see the
-tags used with the ``poky`` Git repository by going to :yocto_git:`/poky/`
+tags used with the ``yocto-docs`` Git repository by going to :yocto_git:`/yocto-docs/`
 and clicking on the ``[...]`` link beneath the "Tag" heading.
 
-Some key tags for the ``poky`` repository are ``jethro-14.0.3``,
-``morty-16.0.1``, ``pyro-17.0.0``, and
-``&DISTRO_NAME_NO_CAP;-&DISTRO;``. These tags represent Yocto Project
-releases.
+Some key tags for the ``yocto-docs`` repository are ``kirkstone-4.0.30``,
+``scarthgap-5.0.1``, and ``&DISTRO_NAME_NO_CAP;-&DISTRO;``. These tags represent
+Yocto Project releases.
 
 When you create a local copy of the Git repository, you also have access
 to all the tags in the upstream repository. Similar to branches, you can
@@ -449,19 +445,19 @@ The most common use is to checkout a working branch that matches a
 specific Yocto Project release. Here is an example::
 
    $ cd ~
-   $ git clone git://git.yoctoproject.org/poky
-   $ cd poky
+   $ git clone git://git.yoctoproject.org/yocto-docs
+   $ cd yocto-docs
    $ git fetch --tags
-   $ git checkout tags/rocko-18.0.0 -b my_rocko-18.0.0
+   $ git checkout tags/&DISTRO_NAME_NO_CAP;-&DISTRO; -b my_&DISTRO_NAME_NO_CAP;-&DISTRO;
 
 In this example, the name
 of the top-level directory of your local Yocto Project repository is
-``poky``. After moving to the ``poky`` directory, the ``git fetch``
+``yocto-docs``. After moving to the ``yocto-docs`` directory, the ``git fetch``
 command makes all the upstream tags available locally in your
 repository. Finally, the ``git checkout`` command creates and checks out
-a branch named "my-rocko-18.0.0" that is based on the upstream branch
+a branch named "my_&DISTRO_NAME_NO_CAP;-&DISTRO;" that is based on the upstream branch
 whose "HEAD" matches the commit in the repository associated with the
-"rocko-18.0.0" tag. The files in your repository now exactly match that
+"&DISTRO_NAME_NO_CAP;-&DISTRO;" tag. The files in your repository now exactly match that
 particular Yocto Project release as it is tagged in the upstream Git
 repository. It is important to understand that when you create and
 checkout a local working branch based on a tag, your environment matches
@@ -596,7 +592,7 @@ MIT license :wikipedia:`here <MIT_License>`.
 
 When you build an image using the Yocto Project, the build process uses
 a known list of licenses to ensure compliance. You can find this list in
-the :term:`Source Directory` at ``meta/files/common-licenses``. Once the
+:term:`OpenEmbedded-Core (OE-Core)` at ``meta/files/common-licenses``. Once the
 build completes, the list of all licenses found and used during that build
 are kept in the :term:`Build Directory` at ``tmp/deploy/licenses``.
 
@@ -617,8 +613,8 @@ Source Definition and the effort for reviewing and approving licenses
 that conform to the Open Source Definition (OSD).
 
 You can find a list of the combined SPDX and OSI licenses that the Yocto
-Project uses in the ``meta/files/common-licenses`` directory in your
-:term:`Source Directory`.
+Project uses in the ``meta/files/common-licenses`` directory in
+:term:`OpenEmbedded-Core (OE-Core)`.
 
 For information that can help you maintain compliance with various open
 source licensing during the lifecycle of a product created using the

-- 
2.51.0


