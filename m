Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150ABD35162
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 09:24:29 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9080.1775035451779211273
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Apr 2026 02:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=HEDyxJv/;
 spf=pass (domain: cherry.de, ip: 52.101.84.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbAifHPrIZGKtCoC85UpE+CI4VDhf+1lnQcJXSuV4rumzfojYvjdJb1u32n+iiMvRqbpp8i0n/FOXo/ntL1b17xRN0R2rV2IfT8z4FHijN4u/ONI+hnjQ10V7fz6mprsQLK/j4aYbkx+N5NPXuZIc30lEfTk587X5KdPeQK8xsC7z4lBc8fUEJHNDG8qjC4z66ODGY45yMLfLr60Ot8n4s0ndYUlhlUD2oHUBVm4yUhiW/lG4npTkNdEPnXvEzyPa7TZLNhJYVDqPbvSy6law7BzMzvoQabaXfnSBBI4V07Nu5gkR3Br505SgEFDKtsFDptXj2LcxeW0QOSOeDbEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8Uns4hlcKtWv5nwmVgIkxvD6le93UjVepS00qL0Fiw=;
 b=bu0hCsHB4C8svF0GFxVPafqIpu+6OtIVuaYk6JoyGDkV+/Iwy5ZycbWe00c/H5docB1Uqaqso76oECX3bV1kiZvPCM6h4p9BeCPSb7qiyPO2NQhBwf3C6Ktnr45kGSRhd4eTL5wShcDBzAEdtlfPg5vUBsrTrbPM2FPGKUrsgU+1QI0iUCZRQFzwn787XPwl7CoVUwilCQ/IsZUl8y/USVo50p+AG6/z0rqaAS04bV5Cj4WRm4u2nmcfYft/LjjSF0M28Uje5zDt1PdOGyfu/jhJd8qlXwj0l+QgaG++c/I6CJ2wArJXnURwkt1K3N9htiFCSFDibCcb1/+i7Pnm3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8Uns4hlcKtWv5nwmVgIkxvD6le93UjVepS00qL0Fiw=;
 b=HEDyxJv/hVH/EjTQGekEwyguJ6kZsIcUT/YYXN36QGuw/AEPWiM59iKGRwcEcQCAsqwZk8omZYbuC2XFUdDYsTyHt/5BlIYLFe+tg3BJuL/N/8WIzkfskIrv6s+CmqDklxJfQmhGvBvhxQjXQQCXpcn4e/TaeGdruu3kZuHSGiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PAXPR04MB9421.eurprd04.prod.outlook.com (2603:10a6:102:2b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Wed, 1 Apr
 2026 09:24:07 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9745.027; Wed, 1 Apr 2026
 09:24:06 +0000
Message-ID: <dd81bf43-d2fb-46e2-a4f1-5dbb76d98dd1@cherry.de>
Date: Wed, 1 Apr 2026 11:24:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [RFC PATCH 1/1] ref-manual: add boot architecture
 documentation
To: Jon Mason <Jon.Mason@arm.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
CC: "jdmason@kudzu.us" <jdmason@kudzu.us>
References: <20260331122924.54516-1-jon.mason@arm.com>
 <20260331122924.54516-2-jon.mason@arm.com>
 <9df0de4f-4a56-4c79-8d0e-fac5b26087fb@cherry.de>
 <AM9PR08MB7184C98BED6AB0E68D9DE16FF053A@AM9PR08MB7184.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <AM9PR08MB7184C98BED6AB0E68D9DE16FF053A@AM9PR08MB7184.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0332.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::18) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PAXPR04MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: ece3fa2b-6fd6-4717-8f93-08de8fd06c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0mr1sakfadxXSdzcI3DAXONYrexhqTkqddt1YqtQ70aSGf+pE2U6VVYOcG+R73IMWc25PvwKsF0jzZrzNBOnp7hBTRygBEJABRQla4IsfhZFJe5lzV6jWjk/hX0Xqofak+qDIO/OCuoCTSwJz65UW+Q655swM04hlhpjQiEnRbVfY9GYPXkPzpUxMslFEzdYpKz4tp7JHXSCpcGvXGDrltRxQPo5BwqDl+fD/N7RL7XINBA/z/+GVKZAfXuYPYlqQIJGfDJUEgLa5+yyF4Ubpx+huaxtCuum6IY9nMp5iSLE0xkhlXKIsjXF3J5iNE+tKpMAZ5dUZ78odyIop/pV2qJmwiiJiYu8Y42Tdju0FlhMwdtxkYA0br58ubFcCYZqtDhVmiLe09xNrz8UZIBYgiXn6FXVhLmm2ccQeHRRAVv6heLgadLsygDXLtzsL4C3VFdU1dJAV34PEQIzxuhKyoh/wApuJ+z7zYa9KSvHubCk7p5SkAZaoAlfQ3Tm61ZFuhI9Pr9JuQI/J+hO6E4zSmKCBHeDRT1Yi19XMBcCJUAcuzs5g77uzQKJfp11EXgbdDZZAnVWaVOiLdmbF1N3PkTLgc9xb9MJEr6t89FUQxIUGdmzKSiumR15YQXwhOr5gwmjuBG/b775ZX45MT+0W7Mtqo10uddeWYzUrnsArqbkB555RAqZwIpwOIs6GFo3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ywpFm5aNgBiuM8RlmAYXBHFUYmi+PprYel571pamRRWrfaWyQzS2EOHSE+Pv?=
 =?us-ascii?Q?tFxzrJILnmpv1niu5uADPHR2XezPkiBXclVoXaGK85QunIjHDFlsAUO+W4eP?=
 =?us-ascii?Q?FUKJ9SIADjkHUUM0Ry+qPI5i0T1xFaYgMjxG5pD3/T+mobO+aZL4gzzN3aGm?=
 =?us-ascii?Q?xo9FUhJTYYXnURWPKIsWEI98LMlwG/4ErAvTXhx+CrrLHZu96XIiteV3FLx6?=
 =?us-ascii?Q?7+8MHARjMaHtdgcI87M9qbr4pKhOcIFBwocp8SrrAidXZVDQ+Q+8Rfe5pUhQ?=
 =?us-ascii?Q?yjR0h+zo80DoL8U1bGfh0uLyVvdCU8TIXDMX+NTxh8J9UZGq0uNBTgnDw+HG?=
 =?us-ascii?Q?QX9N38ghvl2NKIreaO9F3UkiTf+T3/DRGC6UPELbaIwPQuvp/oSmFoo0t1bj?=
 =?us-ascii?Q?PaN1vN1nIXXxhMePntevPmJQpxV/qkDV2b/QtjjRWfwk2YE7+C8kilP0tWvT?=
 =?us-ascii?Q?uFTflU2hkrJvOqXqnS8FTtuHqXxtMFEH0uY7IbRlWO5GTI260Q8OvT3BEpq5?=
 =?us-ascii?Q?GUR3IOgxSJfmW1O1zZBhF45cZL+9fnn1U9MbYOy2sf9CtXYb5YU9WO9R3Zoy?=
 =?us-ascii?Q?Vx5QWV/+FldaGYuxAldL6cAqf84W3g3yyogfjAPC+Y6QO02kxcs8SuPxWNga?=
 =?us-ascii?Q?WFKlp1ueULH9+6hkPtj1tdoQFEcrQeGmZjUxxDbJMOKtIJypGNdo3QqqS+Cb?=
 =?us-ascii?Q?VwEU3a1aFP5cdrfaYCjbjnd99udLQAnpWU1ZWFdjWdQS9c+565XHj9JAxsfq?=
 =?us-ascii?Q?W5dMa3o2jnvmqKcHkOAfMLfmzXAGmMl/dd2Eu0qkDfOxaxeNWf5Y+n+YEfkg?=
 =?us-ascii?Q?iBnJqXQ+uKvnppoPdEWirIu8s1VkCvafWbtGCt7YMM+X6YhMgdySbOJVgKru?=
 =?us-ascii?Q?1T18+2vxrBcNSwXCgGQKRBlTC7T+qiO5UusIQNVxPxyNHb8vEMSZVb4D+gcQ?=
 =?us-ascii?Q?4CAzE1icmIA9FwguwzUhgbehSprs8aWgnzbfb6DWedDNp8/ReGdKEqMZQ9RO?=
 =?us-ascii?Q?IW0+qmbj0pS1tt5Z8hPUHbEzNTbxnKToxn2H6ByACG97U91pzWdsxQ5XsrVS?=
 =?us-ascii?Q?+/4qM1iF8g9rfx/Kj/ZZ3f2TDI/PMwNIbJhMWBSDNayfgD7uFAXMGfEcj6ru?=
 =?us-ascii?Q?imf2qbqAsy8rN2153DrPgVXdCT/EN4s1nd0ygzHbxYZJV4LF1iJ+LHwifAT+?=
 =?us-ascii?Q?TbVVXMEO6IHF7blg1ZFTvXaVOxVjfKpIXzNnAs1INyCT+Ju7ud8bkcAY00OI?=
 =?us-ascii?Q?phKq5iHXfj6eyfPqoEscxFZECwJAjlr8BBdhbt0br4hQ68ezWRh9FkDqTNpE?=
 =?us-ascii?Q?JhubUupmhYsfDDDVTP6Pk++4yWi1YrIe7fbYwCbvrY8TWye1AYsnXv0tWL7d?=
 =?us-ascii?Q?+J5oQukn5nVS9IOb27o7nx9FrVMU+imu4F7SsOapE58UMbdNbNiQ9QwQxfrR?=
 =?us-ascii?Q?BzKutoIRlaf0TJlIV967ETtQiDHcuSUDqcI9NXKnOVELfvV415Wr1g6WLwWy?=
 =?us-ascii?Q?ONQIAKWSP2RbDUP0J216P2JnOFShwA1B6SebxiDbI7dML99uT1oxjpNMltfy?=
 =?us-ascii?Q?rttn/x+4OFnxj+hmeaX1eUPveyjB+U/14RbcTLTgEY0qqmaTd7vABQKTr7uu?=
 =?us-ascii?Q?OeQul+cvgpZpQc1KNgzT8md7gg+el4osNyE9DLicX3zXVfe22nj+gSe6Mb6o?=
 =?us-ascii?Q?B2gexP//ZSMAg20W8N35YEVKKPBf3mhTkdPFoqA7pJVBdr8G/ykJUB2zBxTD?=
 =?us-ascii?Q?2+nLCHiOMJ987/iFtRVYBWus2IJvl1LiQvPZKqCGekNBLz7URVNm?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ece3fa2b-6fd6-4717-8f93-08de8fd06c32
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 09:24:06.7605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8WcP+6I89btqPYVJbfuoWY+PKgWobSHyY02a0K3fR2jVyPOlQuOrCrd1nAFiIrxYJgG/YD+WlfRO45SCTPvMzhEh+dwoSexwh0Z3UNyGQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9421
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Apr 2026 09:24:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9155

Hi Jon,

On 3/31/26 10:06 PM, Jon Mason wrote:
> Hello Quentin,
> Thank you for taking the time to look this over and provide feedback.
>=20
> Work email is outlook and I wasn't smart enough to cc myself on the initi=
al email.  So, I've had to get creative with the inline responses below (vi=
a cut-n-paste and vim).  Please forgive that.
>=20

You can download an .mbox.gz or Atom feed from lore.kernel.org directly,=20
see at the bottom of=20
https://lore.kernel.org/yocto-docs/20260331122924.54516-1-jon.mason@arm.com=
/T/#t.

On Thunderbird (which I use instead of Outlook to access my Microsoft=20
Outlook company emails), you can then use ImportExportNG plugin to=20
import the (first uncompressed) .mbox to have it in Thunderbird as if=20
you had received it. I used to know how to bounce a mail from one=20
address to another but I couldn't find that on Thunderbird last time I=20
checked, that could have been another option.

>=20
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>> Date: Tuesday, March 31, 2026 at 9:53=E2=80=AFAM
>> To: Jon Mason <Jon.Mason@arm.com>, docs@lists.yoctoproject.org <docs@lis=
ts.yoctoproject.org>
>> Subject: Re: [docs] [RFC PATCH 1/1] ref-manual: add boot architecture do=
cumentation
>>
>> Hi Jon,
>>
>> On 3/31/26 2:29 PM, Jon Mason via lists.yoctoproject.org wrote:

[...]

>>> +firmware is usually platform-specific and typically has fewer
>>> +interchangeable implementations than later boot stages.
>>> +
>>> +Examples include:
>>> +
>>> +* Trusted Firmware-A (TF-A)
>>> +* Trusted Firmware-M (TF-M), where applicable
>>> +* System Control Processor (SCP) firmware
>>> +* OpenSBI, which implements the Supervisor Binary Interface (SBI)
>>> +
>>
>> This is not correct for at least Rockchip SoCs. I think it's also not
>> correct for Allwinner SoCs. I **think** TI may be doing this but I have
>> never worked with their SoCs. For Rockchip, a TPL/SPL is loaded first,
>> and then it loads a U-Boot FIT with TF-A, OP-TEE OS and U-Boot proper.
>> So if you will, one boots a first part of the System Firmware, which
>> loads the Platform Firmware which in turn loads the second part of the
>> System Firmware.
>>
>> Note also that people are increasingly wanting to have TF-A/OP-TEE OS as
>> late as possible in the boot process, and I've seen implementations
>> where TF-A is part of the kernel FIT image. This allows to easily update
>> those persistent and security-critical components without requiring a
>> risky bootloader (here called System Firmware) update.
>>
>> I think this may make things even more confusing since the boot process
>> clearly won't be identical for all Aarch64 SoC vendors (at least for the
>> time being) and won't match the documentation. Do you have a plan on how
>> to handle that?
>=20
> And this is the reason why this is an RFC :)
>=20
> I was not aware this is how things are being used in some of the SoCs.  I=
 guess this would provide a fallback if something is broken during an updat=
e.  I'm not sure it is worth the extra layers of indirection and potential =
for that potentially being broken, but probably no point in arguing that he=
re.
>=20

I am not following here, what is "this" starting from the second sentence?

> My intention in this document is to provide a rough idea of how boot work=
s and show what is mutually exclusive, and the logic behind it.  Perhaps th=
ere is a way to rewrite this to allow for it to be generic enough to cover =
the straightforward way I was saying and the indirect way you are saying is=
 used.  I'll see what I can do regarding this in v2.
>=20
It isn't path A or path B.

[...]

>>> +Examples include:
>>> +
>>> +* GRUB
>>> +* Syslinux / EXTLINUX
>>> +* systemd-boot
>>> +
>>> +In Yocto Project builds this layer can also be selected through a
>>> +virtual provider.
>>> +
>>> +The name ``virtual/boot-manager`` reflects the role of this software i=
n
>>> +selecting and loading an operating system kernel from storage.
>>> +
>>> +Example configuration::
>>> +
>>> +   PREFERRED_PROVIDER_virtual/boot-manager =3D "grub-efi"
>>> +
>>> +Some systems boot the kernel directly from system firmware (for exampl=
e
>>> +U-Boot or UEFI). In these cases an additional OS loader is not require=
d.
>>> +
>>
>> What do we do when we're expecting to use the extlinux implementation in
>> U-Boot? Or another implementation? How is this going to be handled?
>> Technically, it **is** syslinux/extlinux, just that the extlinux.conf
>> file needs to be in a bootable partition readable by U-Boot proper (the
>> System Firmware).
>=20
> This is the case that I was trying to reference.  The case where you are =
trying to make sure that grub or systemd-boot isn't used (and thus shouldn'=
t be added to the image).
> I'll clean-up the language to make it clearer.
>=20

Wondering if we cannot have U-Boot extlinux boot a UEFI payload (e.g.=20
grub). It seems like you can boot a FIT which contains a UEFI binary=20
(I'm assuming grub). You can then simply get this FIT using extlinux I'm=20
assuming still.

>>> +Example::
>>> +
>>> +   PREFERRED_PROVIDER_virtual/boot-manager =3D "none"
>>> +
>>> +
>>> +Boot Process by Architecture
>>> +----------------------------
>>> +
>>> +
>>> +Arm (Arm32)
>>> +~~~~~~~~~~~
>>
>>
>>
>> I've seen Aarch32 being used also. The wikipedia page
>> (https://en.wikipedia.org/wiki/ARM_architecture_family) hints at Aarch32
>> being Armv7+ and Arm32 being Armv6-, is this what you wanted to convey?
>>
>> Working at arm I guess it's the kind of information you'd have access
>> to, but then what matters between what marketing says it is and what the
>> public believes it is...
>=20
> There is an ARMv8 core that is 32bit only (A32), there are others that ar=
e 64bit only, and there are a lot that do both.  I'm not trying to muddy th=
e waters here, but more trying to say that there is the legacy 32bit way of=
 doing things ("the easy way" is how I have it in my mind).
>=20
> I didn't think that Aarch32 was used outside of Arm, but if that is less =
confusing then I'm happy to replace Arm32 with Aarch32, or write it in a wa=
y more understandable
>=20

I meant Aarch32 is for 32b Armv7+ cores and Arm32 for 32b Armv6- cores.=20
I guess just make it explicit what the 32/64 part of the name comes from=20
(and potentially mention it can be called Arm32/Aarch32. (We won't say=20
anything about arm in the Linux kernel meaning Arm32, no we won't :) ).

>>
>>> +
>>> +Many Arm32 systems boot directly into U-Boot using its SPL stage.
>>> +
>>> +::
>>> +
>>> +   Boot ROM
>>> +      =E2=86=93
>>> +   U-Boot SPL
>>> +      =E2=86=93
>>> +   U-Boot
>>> +      =E2=86=93
>>> +   Linux Kernel
>>> +
>>> +
>>> +Arm64 (AArch64)
>>> +~~~~~~~~~~~~~~~
>>> +
>>> +Arm64 platforms commonly include Trusted Firmware-A prior to the
>>> +main boot firmware.
>>> +
>>
>>
>>
>> Which SoCs vendors do that? Rockchip doesn't for sure. Allwinner I think
>> as well. TI may. Unsure about the others. Or is this something specific
>> to ACPI-supported Aarch64 platforms?
>=20
> The Arm reference platforms do it this way, but the point you made above =
that others don't has me reconsidering how to make this more complete.  Per=
haps an "Option A" and "Option B" that has both ways.
>=20

I think there are N options, with N increasing every year.

FYI, on some Arm32 Rockchip SoCs, I believe OP-TEE OS (BL32) is required=20
to boot.

Also, Platform Firmware may load another Platform Firmware. That is the=20
case on Rockchip SoCs with U-Boot SPL jumps into TF-A as BL31 which in=20
turn jumps into OP-TEE OS as BL32 which in turn jumps into U-Boot proper.

Also, when I say "Rockchip SoCs", I mean what we've settled for as the=20
"default" boot process. I'm not sure there's anything forbidding you=20
from having a different boot flow.

Note also that there's some people (mainly Simon Glass at that point I=20
think) about VBE (Verified Boot for Embedded) which is yet another boot=20
flow.

Is there any plan to integrate with update software like swupdate/rauc?=20
UEFI-supporting U-Boot seems to support update capsules, I see patches=20
on the U-Boot ML every now and then for adding capsules to Qualcomm,=20
Samsung, Amlogic, Raspberry Pi, NXP, TI, ... devices.

For the sake of completeness, know that Rockchip provides binary blobs=20
for the DDR init (which we call TPL because it's there to replace U-Boot=20
TPL until there's an open-source implem), (ancient) TF-A and OP-TEE OS=20
(as far as I know incompatible with upstream U-Boot). We've plumbing in=20
meta-rockchip to allow picking between blob TF-A or upstream TF-A. Not=20
sure it's important for you, but at least it's out there now :)

[...]

I think the part we're (I am) missing here, is what you're trying to=20
achieve or improve or change. But maybe I'm too early in the discussion=20
(especially since only the docs people are in Cc :) ) and this will be=20
part of the patch series with the actual implementation. Maybe provide a=20
bird eye view on what's the plan in the cover letter to help us out?

Cheers,
Quentin

