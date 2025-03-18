Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51568C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 08:01:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.6477.1742284852156591414
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 01:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KOd5I8XI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31CB744354;
	Tue, 18 Mar 2025 08:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742284850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eWbE7bsuP+97RG3dcooBRRzpr7MqTm4WLDsPECxBiWI=;
	b=KOd5I8XIj7rEYCEEzacdoDCGn5T0407atfsHzoU9ylgeGGECCg2MUnTw1sJRNlVYk4cofj
	1T+3ZoFLasxstmBmYdtbmOL9j8Izojl92e32FZ/PkxCmgLtO5uHZw4l/56DmH32dON06Vl
	HzT5sJQNybkxeo4MzoxlMQ1cRvcz1TLpoc9jYlDXWwWHmvudson5avpUxwTxgERr1GjzaN
	87ohx3REVBzuacwIxOLa6/CcdYB5okz79+phKQciMMKicqqwKeLx+fouRWn3bbSZI1S2y5
	7660gseV+QtO7ASQzTMZVl6L9u/B0znttTQstmSEY/JERd/jEoghnYHbEiqcsg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Mar 2025 09:00:49 +0100
Message-Id: <D8J8FMCWVHQO.227FZKDIPIYG4@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <rybczynska@gmail.com>
Subject: Re: [docs] [PATCH 11/11] migration-guides/release-notes-5.2: update
 for upcoming 5.2 release
Cc: <docs@lists.yoctoproject.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1-30-g1e234577c2bf-dirty
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com> <20250317-release-note-5-2-updates-v1-11-82b0a4182aff@bootlin.com> <CAApg2=Ro3uY7tFWHGgLuuEacrXyFTZET4CL6emPaViviFLqQwQ@mail.gmail.com>
In-Reply-To: <CAApg2=Ro3uY7tFWHGgLuuEacrXyFTZET4CL6emPaViviFLqQwQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedukeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieekjeejvdfhveeuudfgffeigeeltdelhfefgfdugffhtdektdekteduleeiveenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehrhigstgiihihnshhkrgesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrh
 ihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Mar 2025 08:01:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6589

Hi Marta,

On Tue Mar 18, 2025 at 7:50 AM CET, Marta Rybczynska via lists.yoctoproject=
.org wrote:
> On Mon, Mar 17, 2025 at 10:06=E2=80=AFAM Antonin Godard via lists.yoctopr=
oject.org
> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
>
>>
>>
>> +   -  The ``cve-update-db-native`` was restored from kirkstone and can =
be
>> used
>> +      to update the CVE National Vulnerability Database (NVD). Add
>> support for
>> +      the FKIE-CAD (https://github.com/fkie-cad/nvd-json-data-feeds) CV=
E
>> source
>> +      for it.
>> +
>>
>
> Could you add something like:
>
> Users can control the NVD database source using the NVD_DB_VERSION variab=
le
> with possible
> values NVD1, NVD2, or FKIE.

Yes, I added this in the reference manual but forgot to mention here.
Will do in v2.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

