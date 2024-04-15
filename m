Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC7FC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 14:25:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.22532.1713191098001629364
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 07:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZLcvsQKa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 125661BF204;
	Mon, 15 Apr 2024 14:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713191095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BpU3THAm9d3aF/jl1vvkS40SV7k3YRqPEq3q4C0lFPM=;
	b=ZLcvsQKadLd45+kdQ8pmDVuDGo77fhu+bkrtFcCt64zSHrBOJ3uKannjBOagDtRtkx6E7N
	2J2ZNddQlDL1azgGi9rIxL9Qg6jdfQWk03goxMNQlBpOvV7ur/kNXJdMye2McG8GTDLkGY
	FrlRLbI3e9rAQyX5DSAUthC+JZKsDQDgfWIkU3x48V7wAFVIrUDW/BBWaVg5dsI+dG8pBZ
	Lpn+yr8TVxh5G+7kzKe/ZzrLcD+DCs6NMmHgXdq67lguV1+AX4iMR169Sjy7jcJLcpOa8H
	JncuHy9C0vppLt9p63KAZFwj0DBk4jYMMTqvoaj+m13jbXiWWdqISmV3A6F/bw==
Message-ID: <b29fd95b-fa84-4fd6-8eeb-5ec08f66c4e7@bootlin.com>
Date: Mon, 15 Apr 2024 16:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH 7/9] release-notes: Add CVEs, recipe upgrades and
 contributors for 5.0
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
 <d0182baa07ca6bb009b845fcadb1f7fce81a38bd.1713127068.git.bluelightning@bluelightning.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <d0182baa07ca6bb009b845fcadb1f7fce81a38bd.1713127068.git.bluelightning@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 14:25:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5154

Hi Paul

Thanks for this update!

On 4/14/24 at 22:43, Paul Eggleton wrote:
> * Add CVEs from commits
> * Add recipe upgrades using layer index branch comparison
> * Add contributors from commits
>
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>   .../migration-guides/release-notes-5.0.rst    | 564 +++++++++++++++++-
>   1 file changed, 563 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
> index 7767a4229d..21de79a638 100644
> --- a/documentation/migration-guides/release-notes-5.0.rst
> +++ b/documentation/migration-guides/release-notes-5.0.rst
> @@ -264,16 +264,578 @@ The following corrections have been made to the :term:`LICENSE` values set by re
>   Security Fixes in 5.0
>   ~~~~~~~~~~~~~~~~~~~~~
>   
> +-  avahi: :cve:`2023-1981`, :cve:`2023-38469-2`, :cve:`2023-38470-2`, :cve:`2023-38471-2`,

Oops, these last 3 don't work. For example, 
https://nvd.nist.gov/vuln/detail/CVE-2023-38469-2 is invalid.

So, I replaced those with

:cve:`2023-38469`, :cve:`2023-38470`, :cve:`2023-38471`

I hope that's correct, as they still point to Avahi CVEs.


> :cve:`2023-38469`, :cve:`2023-38470`, :cve:`2023-38471`, :cve:`2023-38472`, :cve:`2023-38473`
> +-  bind: :cve:`2023-4408`, :cve:`2023-5517`, :cve:`2023-5679`, :cve:`2023-50387`
> +-  bluez5: :cve:`2023-45866`
> +-  coreutils: :cve:`2024-0684`
> +-  cups: :cve:`2023-4504`
> +-  curl: :cve:`2023-46218`
> +-  expat: :cve:`2024-28757`
> +-  gcc: :cve:`2023-4039`
> +-  glibc: :cve:`2023-5156`, :cve:`2023-0687`
> +-  gnutls: :cve:`2024-0553`, :cve:`2024-0567`, :cve:`2024-28834`, :cve:`2024-28835`
> +-  go: :cve:`2023-45288`
> +-  grub: :cve:`2023-4692`, :cve:`2023-4693`
> +-  grub2: :cve:`2023-4001` (ignored), :cve:`2024-1048` (ignored)
> +-  libgit2: :cve:`2024-24575`, :cve:`2024-24577`
> +-  libsndfile1: :cve:`2022-33065`
> +-  libssh2: :cve:`2023-48795`
> +-  libuv: :cve:`2024-24806`
> +-  libxml2: :cve:`2023-45322` (ignored)
> +-  linux-yocto/6.6: :cve:`2020-16119`
> +-  openssh: :cve:`2023-48795`, :cve:`2023-51384`, :cve:`2023-51385`
> +-  openssl: :cve:`2023-5363`, :cve:`2023-5678`, :cve:`2023-6129`, :cve:`2023-6237`, :cve:`2024-0727`


I had to replace :cve:`2023-6237 by :cve_mitre:`2023-6237` as this was a 
"reserved" CVE.

>   
>   Contributors to 5.0
>   ~~~~~~~~~~~~~~~~~~~
>   
>   Thanks to the following people who contributed to this release:
>   
> +-  Adam Johnston
> +-  Adithya Balakumar
> +-  Adrian Freihofer
> +-  Alassane Yattara
> +-  Alejandro Hernandez Samaniego
> +-  Aleksey Smirnov
> +-  Alexander Kanavin
> +-  Alexander Lussier-Cullen
> +-  Alexander Sverdlin
> +-  Alexandre Belloni
> +-  Alexandre Truong
> +-  Alex Bennée
> +-  Alexis Lothoré
> +-  Alex Kiernan
> +-  Alex Stewart
> +-  André Draszik
> +-  Anibal Limon
> +-  Anuj Mittal
> +-  Archana Polampalli
> +-  Arne Schwerdt
> +-  Bartosz Golaszewski
> +-  Baruch Siach
> +-  baruch@tkos.co.il

Removed that last line as this is the same person :)
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


