Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA41EC4167D
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 15:08:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.33651.1698937693245306760
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 08:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ls089ycN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27EE2E0005;
	Thu,  2 Nov 2023 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698937691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fjyJTO8oGCLYVZ0u7MDvVsOgnP4KG/4rnjD11x2CLuE=;
	b=Ls089ycNJHnMfuvMC3geYyRZCHVkz5Yjpqm4yGtikndEVOZx77imvlbIUo3khT3SjZlT5G
	SxnZKevzYhR9qoQ3xW+t1x4ADhjmcruw9nkrwew9W/CbVPJhsbBAfQQB0yRVgSTk4rnGr4
	/uwDoka5OXUIF9yWJmq8WYGkt/Y8Jbeeaff73uHoMJbrqS691/PGwHS6Dela7j9EBNLAJc
	GqqU9CBBHNHIAq/7xeJPQ3s/RwigBT3Lamukf8jZ697s0PmfkA3oK8hkrnny3AS3M09kOp
	2Q6/fD2QBZnOM3XIPDKI1UadIsur3kl3hFx/mnZxc3rVYTwh4WjxNuri1/pXKA==
Message-ID: <660b0615-73ba-4eb0-b69d-d15a884bf1a0@bootlin.com>
Date: Thu, 2 Nov 2023 16:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] overview-manual: concepts: Add Bitbake Tasks
 Map
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231101084020.92934-1-bhstalel@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231101084020.92934-1-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 15:08:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4574

Hi Talel,

Many thanks for this update and taking all my comments into account.

On 01.11.23 at 09:40, BELHADJ SALEM Talel wrote:
> Create a Map to detail how BitBake handles a recipe's tasks
> and its compile/runtime dependencies along with detailed comments.
>
> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> ---
>   documentation/overview-manual/concepts.rst    | 166 ++++++++++++++++++
>   .../overview-manual/svg/bitbake_tasks_map.svg |   4 +
>   2 files changed, 170 insertions(+)
>   create mode 100644 documentation/overview-manual/svg/bitbake_tasks_map.svg

I'm going to accept your patch, with these minor changes already 
applied, for your information:

--- a/documentation/overview-manual/concepts.rst

+++ b/documentation/overview-manual/concepts.rst

@@ -2227,12 +2227,16 @@ Before presenting the contents of each file, here are the steps

  that we need to follow to accomplish what we want in the first place,

  which is integrating ``sayhello`` in our root file system:

  

-#. Create a Git repository for each project with the corresponding files

-#. Create a recipe for each project

-#. Make sure that ``sayhello`` recipe :term:`DEPENDS` on ``libhello``

-#. Make sure that ``sayhello`` recipe :term:`RDEPENDS` on ``libhello``

-#. Add ``sayhello`` to :term:`IMAGE_INSTALL` to integrate it into

-   the root file system

+#.  Create a Git repository for each project with the corresponding files

+

+#.  Create a recipe for each project

+

+#.  Make sure that ``sayhello`` recipe :term:`DEPENDS` on ``libhello``

+

+#.  Make sure that ``sayhello`` recipe :term:`RDEPENDS` on ``libhello``

+

+#.  Add ``sayhello`` to :term:`IMAGE_INSTALL` to integrate it into

+    the root file system

  

  The following are the contents of ``libhello/Makefile``::

  

@@ -2252,7 +2256,7 @@ The following are the contents of ``libhello/Makefile``::

  .. note::

  

     When creating shared libraries, it is strongly recommended to follow the Linux

-   conventions and guidelines. (see `this article

+   conventions and guidelines (see `this article

     <https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html>`__

     for some background).

  

@@ -2353,5 +2357,5 @@ to build the recipe.

  The following diagram shows the sequences of tasks that BitBake

  executes to accomplish that.

  

-.. image:: svg/bitbake_tasks_map.svg

+.. image:: svg/bitbake_tasks_map.*

     :width: 100%


This being said, I am facing a last issue with Inkscape. The numbered 
disks are rendered in black (you don't see the numbers), while this 
doesn't happen with the black boxes with "D", "S"....

You can check this by opening the SVG file with Inkscape or running 
"make latexpdf" and opening the resulting PDF in 
_build/latex/theyoctoproject.pdf

Would you mind having a look so that we can fix it in an upcoming 
commit? We need to make sure people can edit the diagram using Inkscape.

Merged in master-next anyway.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


