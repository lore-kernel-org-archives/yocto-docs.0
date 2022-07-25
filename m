Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34744C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 18:15:19 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web09.31723.1658772911131165924
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Jul 2022 11:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=VR7s/b6F;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 26PIF6PP646095
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <docs@lists.yoctoproject.org>; Mon, 25 Jul 2022 20:15:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1658772906;
	bh=ods/jFByCPv9RGJEJPWCH+Yj3YVf0uZsHvJiq8vE+Lg=; l=503;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=VR7s/b6FSR36lRN/imOWeBzXa+GbYBBeYn7yR2f4AvHs7nnyqogKVe428htA3RORd
	 lTaxdOOeJCwWW2w2I9XH50D49x1kiFe/etzzTVpX5bay8pnsBvIMeQpKGFIR6Vfspt
	 zn1lsD42O/euH7HY1J8nepnYN8Pkgas08k0vo3R/B0pX37zi0Bonzk5xkoJJa5re4V
	 xJ+HIOcRTd6vVC/g6nmaOWgpInzlZme6ohgL1t/e4z8mNmwpamk8tw95m+KCkevyqi
	 20zj6wdKij88kBcWDlkhTm0BHDyYSwkpm1zLp00FqT+ZBoSqVL3XI6+a7tNj8QC9mw
	 81qZ9shffFxAw==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 26PIF2LP575031
	for <docs@lists.yoctoproject.org> from enrico.scholz@sigma-chemnitz.de;
 Mon, 25 Jul 2022 20:15:03 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 1479363FA9D; Mon, 25 Jul 2022 20:15:01 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 26PIEwTf440211
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 25 Jul 2022 20:14:58 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1oG2ba-00FmrU-DX;
	Mon, 25 Jul 2022 20:14:58 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Marek Vasut" <marex@denx.de>
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [bitbake-devel] [PATCH v3] bitbake-user-manual: Document
 override :append, :prepend, :remove order
References: <20220725155625.381756-1-marex@denx.de>
Date: Mon, 25 Jul 2022 20:14:58 +0200
In-Reply-To: <20220725155625.381756-1-marex@denx.de> (Marek Vasut's message of
	"Mon, 25 Jul 2022 17:56:25 +0200")
Message-ID: <lyr12983fh.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Jul 2022 18:15:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3085

"Marek Vasut" <marex@denx.de> writes:

>  
> +.. note::
> +
> +   The overrides are applied in this order, ":append", ":prepend", ":remove".
> +   This implies it is not possible to re-append previously removed
>     strings.

fwiw, this is possible by anonymous python functions which are evaluated
after ":remove"

| FOO = "123 abc XYZ"
| 
| python () {
|     v = d.getVar('FOO')
|     d.setVar('FOO', v + ' abc 789')
| }
| 
| FOO:remove = "abc XYZ"

results in

| FOO="123   abc 789"



Enrico

