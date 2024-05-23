Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAA8C25B7A
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 09:05:20 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.11009.1716455110311298347
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 02:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RwjOq/1/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A086240010;
	Thu, 23 May 2024 09:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716455108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/s4F7idyOZuZa3+7Z97FBDrWrdCNaoAv+obCdyvuNsE=;
	b=RwjOq/1/5pj/DqrO0ES7pOP+X90qeHTJh8GxKUDxbxUtjfLIulSgmdKXhN33zMXQHXNRLz
	VIcX+llShcMDS3vs8q7iPqHH4dHBI33OheOyKjPHYeuO/3zJwP/qtLG8qC9uHH+U7B8tcb
	GiMSP/7peguSnJi8u/d7KPwYPQc+KH73giVBmbwQKa7TUVbdbqZiJgw41oXX1mUJarPDq5
	JH907k2FYClnweDniD6JLb3Hdzc080PAa6u0G4/sD+NffH49ZFNTqOMzjMwp/7sJILDYLL
	FJto4zwnTRojODQItwemutOOthpbNtw4WODaUfmli6CewaCVt3dOonm4hfpuUg==
Message-ID: <d8ef3518-b299-4ea5-88df-85dde63bea3a@bootlin.com>
Date: Thu, 23 May 2024 11:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs <docs@lists.yoctoproject.org>
Subject: Re: [docs] WOKRDIR change transition guide/notes
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-architecture <openembedded-architecture@lists.openembedded.org>
References: <4760bef7826c511c0a664e4e58ab5560cd340358.camel@linuxfoundation.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <4760bef7826c511c0a664e4e58ab5560cd340358.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 09:05:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5235

Hi Richard,

On 5/15/24 at 15:12, Richard Purdie wrote:
> Now that there is a roughly ready patchset for this I wanted to write
> down a quick guide to converting recipes.
>
> S = ${WORKDIR}
> ==============
>
> If a recipe has S set to be WORKDIR this is no longer supported.
> Currently you'll see warnings, those will become errors very soon and
> even now, the code probably isn't safe to work like that. The recipe
> should be changed to:
>
> S = "${WORKDIR}/sources"
> UNPACKDIR = "${S}"
>
> Any WORKDIR references where files from SRC_URI are referenced should
> be changed to S. These are commonly in do_compile, do_install and
> LIC_FILES_CHKSUM.
>
>
> WORKDIR references in the recipe
> ================================
>
> WORKDIR references in other recipes need auditing. If they reference
> files from SRC_URI, they likely need changing to UNPACKDIR. These are
> commonly in do_compile and do_install for things like service or
> configuration files.
>
> One unusual one is ${WORKDIR}/${BP} should probably be ${S}.
>
> References to "../" in LIC_FILES_CHKSUM or elsewhere may need changing
> to UNPACKDIR.
>
> References to WORKDIR in sed commands are usually left as they are now.
>
>
> General notes
> =============
>
> Files from do_unpack now unpack to WORKDIR/sources-unpack/ rather than
> WORKDIR/.
>
> If S is set to a subdirectory under WORKDIR and that subdirectory
> exists in sources-unpack after do_unpack runs, it is moved to WORKDIR.
> This means S = "${WORKDIR}/${BP}", S = "${WORKDIR}/git" and also deeper
> paths continue to work as expected without changes. We cannot use
> symlinks to do this as it breaks autotools based recipes in weird and
> interesting ways I didn't feel like exploring.
>
> At this time, keeping all sources under sources-unpack isn't being
> considered as it means more invasive recipes changes. The key issue is
> separating the unpack task output from WORKDIR which this change
> achieves.
>
> Previously, S was always created but after the recent changes it is
> not. This means the check in do_unpack_qa triggers where S is not
> created by a recipe where as it did not before. This can mean adding a
> S definition to a recipe that only uses file:// SRC_URI entries.
>
> Building C files from UNPACKDIR without setting S to point at it does
> not work as our debug prefix mapping doesn't handle that.
>
> devtool and recipetool have been updated to handle this and their
> support for S = WORKDIR and oe-local-files has been removed.


Thanks for these guidelines.
I will first submit a patch to start migration and release notes for 
5.1, and then will add your notes to the new migration notes.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


