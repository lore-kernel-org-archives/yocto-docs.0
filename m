Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725BBC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:35:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.90476.1783078491903968211
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XDDMGkKp;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7E21CC79ABE
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:35:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 817DA60300;
	Fri,  3 Jul 2026 11:34:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A2F3104C958E;
	Fri,  3 Jul 2026 13:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783078488; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NPsrd0rk9N+MPP5efEDOJ65rFil3MoLJC4Fim27t+lQ=;
	b=XDDMGkKp02CAfWCQ9xGMyj3SC4llILa/kPCPd2hRo/LUNYjXD5mAhgQxq8zyZLboqOeaEE
	QRYu9RgN62jv2Jq2OHza0EBQQVJwlHb1RJIhF8xS9tNBs5wnbig4Rudei5njWsDSRBEbgC
	3HqPDywmpNbrmx/heIjtoz4ddF1kELFSv8Sgq9wmcWRlsPUhyANEIBLXY2sX/6dSs71zCP
	GG7XO3XRR448zwXaQRAas1jEK4WSlq1Ln3blqpkt8VzeJatlToH1/fKiDkSKcSmfq6hQj8
	DoTR2q/VQWGRnXY1NQJNdhVwGsYRsA5y1BplcclABm3/eTPugvDfxofoLBWZ6A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 13:34:47 +0200
Message-Id: <DJOWKKVOEWNV.2NBEEBEC1C39P@bootlin.com>
Subject: Re: [docs] [PATCH 2/3] tools/check-glossaries: fix default doc path
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
References: <20260702-pre-commit-v1-0-0ebd211b5d5e@bootlin.com>
 <20260702-pre-commit-v1-2-0ebd211b5d5e@bootlin.com>
 <ade7e005-93df-433c-8b02-e520b0e9478b@cherry.de>
In-Reply-To: <ade7e005-93df-433c-8b02-e520b0e9478b@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:35:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10013

Hi,

On Fri Jul 3, 2026 at 12:22 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 7/2/26 3:59 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> This default path pointing to the documentation was wrong, fix it.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/tools/check-glossaries | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/documentation/tools/check-glossaries b/documentation/tools/=
check-glossaries
>> index 9f1a47126..6bfddcfda 100755
>> --- a/documentation/tools/check-glossaries
>> +++ b/documentation/tools/check-glossaries
>> @@ -14,7 +14,7 @@ def parse_arguments() -> argparse.Namespace:
>>  =20
>>       parser.add_argument("-d", "--docs-dir",
>>                           type=3DPath,
>> -                        default=3DPath(os.path.dirname(os.path.realpath=
(__file__))) / "documentation",
>> +                        default=3DPath(os.path.dirname(os.path.realpath=
(__file__))) / "../",
>
> Path(__file__).resolve().parent.parent
>
> is much more readable IMO (and also, we avoid the mental gymnastic of=20
> seeing ../ and having to remove the last directory in the path.
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

True, we also don't need the os module with this anymore, thanks! v2 incomi=
ng.

Antonin

