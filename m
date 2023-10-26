Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883A1C25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 17:26:08 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.206558.1698341159730818398
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 10:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 39QHNrpW015146;
	Thu, 26 Oct 2023 12:23:54 -0500
Message-ID: <64617cf6-804f-0250-12e4-fd9b3a84066b@kernel.crashing.org>
Date: Thu, 26 Oct 2023 12:23:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [docs] Possible runqemu release note for Nanbield
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        docs@lists.yoctoproject.org
References: <da900cde-800c-5b0e-80cb-199a93652b50@kernel.crashing.org>
 <017352c4-f01c-4324-8b76-bb425be33fd3@bootlin.com>
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <017352c4-f01c-4324-8b76-bb425be33fd3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 39QHNrpW015146
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Oct 2023 17:26:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4505

After following up with Richard, maybe this can be simplified?

For runqemu and automated (testimage) testing the Yocto Project requires =
a=20
minimum of 2 working serial ports in Linux.  As of (commit below) this is=
 now=20
enforced by the code.

The stuff below is one _possible_ way of resolving this.

On 10/26/23 10:59=E2=80=AFAM, Michael Opdenacker wrote:
> Hi Mark
>=20
> On 25.10.23 at 22:58, Mark Hatle wrote:
>> While porting meta-xilinx to nanbield I ran into a difference with the
>> way runqemu works.=C2=A0 I figure this might be something that should =
be a
>> release note, but unfortunately I'm not sure I understand how to
>> explain it well.=C2=A0 Below are my findings and maybe we can word-smi=
th
>> this into a proper release note.
>>
>> In Mickledore and before 'runqemu' when run like:
>>
>> runqemu nographic
>>
>> would automatically add "-serial mon:stdio" after the QB_OPT_APPEND
>> values as necessary.=C2=A0 (It might have also added "-serial null" in=
 some
>> cases, but after "-serial mon:stdio".). After the commit:
>>
>> https://git.yoctoproject.org/poky/commit/?h=3Dnanbield&id=3D8c4bb95c1c=
472f9eb5235b848e57febcac53aa59
>>
>>
>> This has changed to counting the number of serial ports and adding
>> "-serial null" if the QB_OPT_APPEND only defined a single serial port,
>> and if two or more ports are specified avoiding automatically adding
>> -serial mon:stdio.=C2=A0 This can break some existing QEMU based
>> configurations by changing the way the serial ports are automatically
>> determined when runqemu is executed.
>>
>> It may be necessary to compare a prior working (Mickledore) executing
>> and adjusting QB_OPT_APPEND to include the correct ordering and number
>> of serial ports of the emulated machine.
>>
>>
>>
>> Hopefully Richard or someone can verify what I wrong about is
>> accurate, and maybe adjust it to better explain how a user should
>> adjust their BSP integration.
>=20
>=20
> Thanks for sharing this!
> I'll write something from your explanations and I we'll see whether
> people have things to correct.
> Cheers
> Michael.
>=20

