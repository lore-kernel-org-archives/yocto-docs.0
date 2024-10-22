Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B864D1CDC7
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 09:16:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.14218.1729588603089414911
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 02:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=N6E4hmXS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20745FF808;
	Tue, 22 Oct 2024 09:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729588601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KizBiU6IVCMecHxdAHhPkfH+1FmneZVSY5S2tw1iA1Y=;
	b=N6E4hmXSGvVpYwTnL4257kPvnb+xEOWaMZD+T/rilcQ3nu4dhmpAB97xArhjmMTHFL87XS
	QK/YkJv0xPmQxmkuLOKVRF/Nlj5FNP3vXO3RyhExr8ZF4/7vGtI/wDnHy6ElyRephs/pDw
	UQoRG7SV2osH2B28yccOjdU4gquk5yUqn4GEAAGQ/+s+mAz9ZWKY39EtUpm/r4DEsFMwJz
	oksPwQf/0mBEr+oPK4Q4lixifh/xLuPDNpTwZPdz2NlGrAZ+aJTgNfBJuEn2OTpv7IxCjR
	fHN+PcKn5VlnMmOxmQFbXwSK7mNkN8BodRlr2x+6bAsB5h5LbeRI2AcaWvXdAA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Oct 2024 11:16:40 +0200
Message-Id: <D527ZM5T62V4.3CYI2VZRRTJDX@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>, "Quentin
 Schulz" <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCH] ref-manual: update releases.svg
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r77.gd58065ac
References: <20241018-update-releases-svg-v1-1-502899b5d780@bootlin.com>
 <82a4e314-cedc-4cb4-a8a9-bc3fd3e81c94@cherry.de>
 <a6fd7c5d-661b-4558-b325-51dd19113cda@rootcommit.com>
In-Reply-To: <a6fd7c5d-661b-4558-b325-51dd19113cda@rootcommit.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 09:16:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5551

Hi Quentin, Michael,

Thanks for the reviews. Answering here to you both to make it easier. :)

On Fri Oct 18, 2024 at 4:01 PM CEST, Michael Opdenacker wrote:
> Hi Antonin
>
> Thank you for the update! I was thinking about it too :)
>
> On 10/18/24 13:53, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> On 10/18/24 1:38 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> * Add Walnascar release.
>>> * Remove dunfell, gatesgarth, hardknott, honister: these release are no=
t
>>> =C2=A0=C2=A0 supported anymore. Start from kirkstone, which is still su=
pported.
>>>
>>
>> I think we also need to update the paragraph where this appears.
>>
>> Indeed, we're missing the information that Scarthgap is the latest LTS
>> and is supported until 2028 (it's in the SVG though, so maybe that's
>> enough?).

Agreed, I missed this!

>> I would keep the releases that are unmaintained but newer than the
>> last LTS.

This is what I thought also. So since Dunfell is not maintained anymore I
removed it, and the subsequent releases up to Kirkstone since they are also=
 EoL.

>> The issue is that Styhead (and Walnascar) is going to be EoL
>> before Scarthgap, so are we going to update the SVG in Scarthgap when
>> Styhead is EoL? If not, then we'd be inconsistent with what we've done
>> for Kirkstone for example.
>>
>> Just trying to figure out what's the plan here so we can stick to it :)

My thought process was maybe a bit simpler: no matter what the release is, =
the
SVG should always show the current state of the releases. I was in fact pla=
nning
on backporting this to styhead, scarthgap and kirkstone.

And when styhead is EoL, update the diagram again + backport on maintained
branches (and styhead).

I think this is what was done on Kirkstone? It seems to also be up-to-date
compared to master.

>> It'd be nice if you have the SVG published somewhere so we can see it
>> without applying the patch locally, is this something you could do to
>> make reviewing easier?

Sure, I will add a link in my v2, along with the paragraph changes.

> In addition to agreeing with Quentin, I also note that in the previous
> versions of the diagram, the future releases were in lighter gray, as a
> way to distinguish them from past ones. That's not strictly necessary as
> we can see their dates too, though.

Ha, I thought it was a mistake at first! Will revert this.

> You could either change this or decide to color all EOL releases and
> future ones in light gray, which could also make sense.

I think a small legend and a color difference to distinguish between future=
 and
eol could be nice? I've prepared something on my side, will send it in my v=
2
soon=E2=80=A6 :)

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

