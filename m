Return-Path: <talel.hajsalem@sofia-technologies.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F6EEB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 11:34:36 +0000 (UTC)
Subject: Re: Yocto Tasks Detailed Diagram Proposal
To: docs@lists.yoctoproject.org
From: "BELHADJ SALEM Talel" <talel.hajsalem@sofia-technologies.com>
X-Originating-Location: TN (193.95.99.58)
X-Originating-Platform: Linux Chrome 114
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 22 Jun 2023 04:34:32 -0700
References: <85e61da1-26b2-1f9e-2170-ba336b3e78c0@theobroma-systems.com>
In-Reply-To: <85e61da1-26b2-1f9e-2170-ba336b3e78c0@theobroma-systems.com>
Message-ID: <18651.1687433672747999997@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="3VmNvpbUypWE5jrxDY6p"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 11:34:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4023

--3VmNvpbUypWE5jrxDY6p
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Quentin,

Thanks for your reply,

>=20
> what this is supposed to represent or in which scenario this would be a
> diagram

The diagram is the detailed process of how bitbake will handle building a r=
ecipe that depends on other recipe, and show the details of the working dir=
ectory of a recipe which I noticed that lot of Yocto developers get confuse=
d with.

>=20
> I've seen you've continued to post a few things here and there on LinkedI=
n
> too, nice :)

I have lot of contributions in mind: diagrams, documentation, classes, new =
bitbake binary ideas based on Bitbake python library, for example you can h=
ave a look at : bitbake-recipe which looks for all recipes that start with =
a given input, and show its path, version, and other information (Covering =
limitation of devtool and bitbake-layers on the topic of looking for recipe=
s): GitHub link: https://github.com/bhstalel/bitbake-recipe

I would like to start contributing, but I need a quick meeting with a contr=
ibutor to explain to me the meetings, patch sending process ,... etc

I will take your comments about " *sysroot-destdir* " into consideration an=
d I will start fixing the diagram and prepare the SVG format.

Thanks,
Talel

--3VmNvpbUypWE5jrxDY6p
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Quentin,<br /><br />Thanks for your reply,<br /><br />
<blockquote><span style=3D"white-space-collapse: preserve;">what this is su=
pposed to represent or in which scenario this would be a diagram</span></bl=
ockquote>
The diagram is the detailed process of how bitbake will handle building a r=
ecipe that depends on other recipe, and show the details of the working dir=
ectory of a recipe which I noticed that lot of Yocto developers get confuse=
d with.<br /><br />
<blockquote><span style=3D"white-space-collapse: preserve;">I've seen you'v=
e continued to post a few things here and there on LinkedIn too, nice :)</s=
pan></blockquote>
I have lot of contributions in mind: diagrams, documentation, classes, new =
bitbake binary ideas based on Bitbake python library, for example you can h=
ave a look at : bitbake-recipe which looks for all recipes that start with =
a given input, and show its path, version, and other information (Covering =
limitation of devtool and bitbake-layers on the topic of looking for recipe=
s): GitHub link:&nbsp;<a href=3D"https://github.com/bhstalel/bitbake-recipe=
" target=3D"_blank" rel=3D"noopener">https://github.com/bhstalel/bitbake-re=
cipe</a><br /><br />I would like to start contributing, but I need a quick =
meeting with a contributor to explain to me the meetings, patch sending pro=
cess ,... etc<br /><br />I will take your comments about "<span style=3D"wh=
ite-space-collapse: preserve;"><strong>sysroot-destdir</strong>" </span>int=
o consideration and I will start fixing the diagram and prepare the SVG for=
mat.<br /><br />Thanks,<br />Talel

--3VmNvpbUypWE5jrxDY6p--

