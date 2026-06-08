Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498EDCD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 15:28:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57382.1780932522421103303
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 08:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=L1WV7Thq;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2422BC5147B;
	Mon,  8 Jun 2026 15:28:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1353C5FFB7;
	Mon,  8 Jun 2026 15:28:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB6E8106A1172;
	Mon,  8 Jun 2026 17:28:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780932519; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Tv1vTPos4RcRsuaPYjb9bp5zYU8wkTXglNAGIiTzZ7I=;
	b=L1WV7ThqwFVZlSDCrEaoOX0rpBY929YvLUVZIHCGW7gOqWSY0s+i9KhsOXw+zNKyoikKRq
	cViSe9T0Tp+kMH8EwmlFZ0pr+w719G0Hl/k7W4uYVwKXfXrcqrZXgZEUXigypScCXD8kFm
	jc0nyIpZANv6eJFEA+GhhHqeIGI4+mMsXq6zTGU3brhl5Lbwuvip+0ODIFHb6HwgkccP4c
	/MWQjigji5f5uMs95qQsHL1zPxoqYpyHFDSzp35T8YkSmKLPF4aCORbNgYguS4k5rKT7P4
	hqKUB9knlxx5lXZGiwmXdBtRZO+A3tYmqUUsgv87omt7UcdF7TEhYbutxeDEQw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 17:28:37 +0200
Message-Id: <DJ3RVZMXBB3T.129EIAP8FEH63@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, <chee.yang.lee@intel.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] migration-guide: add release notes for 5.0.18
References: <20260605102453.2102163-1-chee.yang.lee@intel.com>
 <DJ16III1L1GN.2O92K0NWMB5RE@bootlin.com>
 <DJ1G8TYU29O5.3UOXLB4S0H9RB@smile.fr>
In-Reply-To: <DJ1G8TYU29O5.3UOXLB4S0H9RB@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Jun 2026 15:28:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9627

Hi,

On Fri Jun 5, 2026 at 11:55 PM CEST, Yoann Congal wrote:
> On Fri Jun 5, 2026 at 4:18 PM CEST, Antonin Godard via lists.yoctoproject=
.org wrote:
>> Hi,
>>
>> How are there so many new CVE status updates for the kernel? Is it linke=
d to a
>> recent change on Scarthgap? Could we mention it in the release notes? Th=
is seems
>> a bit out of the ordinary.
>
> I think this is linked to
> linux/generate-cve-exclusions: backport script from master branch
> https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3D66a13f93403533b95ed27eed24931aa310f8ce79
> linux-yocto/6.6: update CVE exclusions (6.6.123)
> https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3D4bdf5345c32c9e294a64d61af49ce2adabdaf1db
>
> Basically, the cve exclusion list jumped from 6.6.32 to 6.6.123 in one
> commit.

Ok, I've added this sentence at the beginning of the section:

"""
The large number of CVE updates for the ``linux-yocto`` recipe is linked to=
 two backport
commits on :term:`OpenEmbedded-Core (OE-Core)`. See
:oecore_rev:`66a13f93403533b95ed27eed24931aa310f8ce79` and
:oecore_rev:`4bdf5345c32c9e294a64d61af49ce2adabdaf1db` for more details on =
these
changes.
"""

Antonin

