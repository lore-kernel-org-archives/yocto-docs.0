Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4403C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 08:20:18 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.5735.1667895607649680670
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 00:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V5jazNdF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1264D6000B;
	Tue,  8 Nov 2022 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667895605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dre/KR646kX4fAwyuSzsARAmyS6rqAKy7DgK/Tal60g=;
	b=V5jazNdFsM5YxxoufmYLY+q44RCV0Klvscn0ceLx6oc5UiycNrtVuIH1NjAm5Pzswiz/SG
	aodnhO/uqRPwpE5eNHTSRHZbkhzhxCz3/M7XSJztK6GCz6i9eNjL5BdxR7Hy6rXpH2bJ5m
	TFS4KW83YS5k1vBq7cSxKi0tZC5P3C5YEEerhoDYatONATHvhAM/nuat+RJ33gUZuWADvD
	cZVy+siCuGs0F1FuY3I1o/cxGHIK+V/ygDLmP7QHzLCENe7t9gl7Q1F8WVtP5LZHHM8+Tu
	pxPt2hDc67CjHJyLzVmW7berhYVjb7JVtD2kuVTnj5ATaa+/vmOAvBzk+LUJSw==
Message-ID: <87b8a14f-530d-fb50-bd7f-c475249315b3@bootlin.com>
Date: Tue, 8 Nov 2022 09:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration guides: add release notes for 4.0.5
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20221108075226.2889942-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221108075226.2889942-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Nov 2022 08:20:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3468

Hi Chee Yang,

Thanks for the release notes in RST format.
I found a few issues but I fixed them...

On 11/8/22 08:52, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.0.rst          |   1 +
>   .../migration-guides/release-notes-4.0.5.rst  | 196 ++++++++++++++++++
>   2 files changed, 197 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.0.5.rst
>
> diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
> index 9f67daaff..eb0744cc7 100644
> --- a/documentation/migration-guides/release-4.0.rst
> +++ b/documentation/migration-guides/release-4.0.rst
> @@ -9,3 +9,4 @@ Release 4.0 (kirkstone)
>      release-notes-4.0.2
>      release-notes-4.0.3
>      release-notes-4.0.4
> +   release-notes-4.0.5
> diff --git a/documentation/migration-guides/release-notes-4.0.5.rst b/documentation/migration-guides/release-notes-4.0.5.rst
> new file mode 100644
> index 000000000..6db449e11
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-4.0.5.rst
> @@ -0,0 +1,196 @@
> +Release notes for Yocto-4.0.5 (Kirkstone)
> +-----------------------------------------
> +
> +Security Fixes in Yocto-4.0.5
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  qemu: fix :cve:`2021-3750`, :cve:`2021-3611` and :cve:`2022-2962`
> +-  binutils : Fix :cve:`2022-38126`, :cve:`2022-38127` and :cve:`2022-38128`
> +-  tff: Fix :cve:`2022-2867`,:cve:`2022-2868` and :cve:`2022-2869`

Here, the missing space before ":cve" was preventing the macro from 
being expanded. I fixed that.
You also have a mix of "Fix" and "fix" at the beginning of lines. Not a 
significant issue, but this distracted my brain. Fixed too.

>
> +
> +Repositories / Downloads for Yocto-4.0.5
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +poky
> +
> +-  Repository Location: https://git.yoctoproject.org/git/poky


Oops, bad link. It should be https://git.yoctoproject.org/poky instead 
(no "git" subdirectory).
Fixed, but I realize I missed this in previous release notes. I'll send 
a patch soon.

> +-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
> +-  Tag:  :yocto_git:`yocto-4.0.5 </poky/log/?h=yocto-4.0.5>`
> +-  Git Revision: :yocto_git:`2e79b199114b25d81bfaa029ccfb17676946d20d </poky/commit/?id=2e79b199114b25d81bfaa029ccfb17676946d20d>`
> +-  Release Artefact: poky-2e79b199114b25d81bfaa029ccfb17676946d20d
> +-  sha: 7bcf3f901d4c5677fc95944ab096e9e306f4c758a658dde5befd16861ad2b8ea
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.5/poky-2e79b199114b25d81bfaa029ccfb17676946d20d.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.5/poky-2e79b199114b25d81bfaa029ccfb17676946d20d.tar.bz2
> +
> +openembedded-core
> +
> +-  Repository Location: https://git.openembedded.org/openembedded-core
> +-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
> +-  Tag:  :oe_git:`yocto-4.0.5 </openembedded-core/log/?h=yocto-4.0.5>`
> +-  Git Revision: :oe_git:`fbdf93f43ff4b876487e1f26752598ec8abcb46e </openembedded-core/commit/?id=fbdf93f43ff4b876487e1f26752598ec8abcb46e>`
> +-  Release Artefact: oecore-fbdf93f43ff4b876487e1f26752598ec8abcb46e
> +-  sha: 2d9b5a8e9355b633bb57633cc8c2d319ba13fe4721f79204e61116b3faa6cbf1
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.5/oecore-fbdf93f43ff4b876487e1f26752598ec8abcb46e.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.5/oecore-fbdf93f43ff4b876487e1f26752598ec8abcb46e.tar.bz2
> +
> +meta-mingw
> +
> +-  Repository Location: https://git.yoctoproject.org/git/meta-mingw


Same here. All references to repositories on 
https://git.yoctoproject.org/ as impacted.

> +-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
> +-  Tag:  :yocto_git:`yocto-4.0.5 </meta-mingw/log/?h=yocto-4.0.5>`
> +-  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
> +-  Release Artefact: meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1
> +-  sha: 49f9900bfbbc1c68136f8115b314e95d0b7f6be75edf36a75d9bcd1cca7c6302
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.5/meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.5/meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1.tar.bz2
> +
> +meta-gplv2
> +
> +-  Repository Location: https://git.yoctoproject.org/git/meta-gplv2


Same here too

> +-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
> +-  Tag:  :yocto_git:`yocto-4.0.5 </meta-gplv2/log/?h=yocto-4.0.5>`
> +-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
> +-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> +-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.5/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.5/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
> +
> +bitbake
> +
> +-  Repository Location: https://git.openembedded.org/bitbake
> +-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
> +-  Tag:  :oe_git:`yocto-4.0.5 </bitbake/log/?h=yocto-4.0.5>`
> +-  Git Revision: :oe_git:`c90d57497b9bcd237c3ae810ee8edb5b0d2d575a </bitbake/commit/?id=c90d57497b9bcd237c3ae810ee8edb5b0d2d575a>`
> +-  Release Artefact: bitbake-c90d57497b9bcd237c3ae810ee8edb5b0d2d575a
> +-  sha: 5698d548ce179036e46a24f80b213124c8825a4f443fa1d6be7ab0f70b01a9ff
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.5/bitbake-c90d57497b9bcd237c3ae810ee8edb5b0d2d575a.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.5/bitbake-c90d57497b9bcd237c3ae810ee8edb5b0d2d575a.tar.bz2
> +
> +yocto-docs
> +
> +-  Repository Location: https://git.yoctoproject.org/git/yocto-docs

Same here too.
Fixed and merged into master-next.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


