Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15423.1793376879036954091
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2026 09:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=UTxWH90G;
 spf=pass (domain: cherry.de, ip: 52.101.69.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWsj7P1BJeQKNL5RO/BgwA6PLUsXkWv/K9uFTsjQO+F2Tr9O4MMIbZ+PzNE9x2JrOTnKiFinvDH4sVPyRMVdh7CdgzMHa94VvgBF4PLa1yDq6HbjZxLg4XM1VRGVdjN9AqFm8bf9qWNfCJB7exlCFcyITP1V4/YSNxmIQVIWBHybygzf3lWCd0KWSHo9nMhwxMoUv1sKmyCxcZ6/2pSrgloRkZdJYfcCU2yT290DxV6UdnklbA7lJgHIeBwaQT5GEr96lN/VF73bDw8ADUxbpg1EP5/+aZuvcB8E/YL00ipJk0IXhb6ZiLqmc9YeaamHZqwhgCWu7VeT9CHKGust2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9mul3flXMx7uQ5T9znXvyXwzOT+EySBr0hbdE+UUtI=;
 b=e8bgyHjDK5zp54FKK4f6srZA4EY3gUf4I7jKqrf+1IS11fJ0mXOzFw0dLHxqrJdzEL1TEf51/pZDVbTk2/bfD1wPrIpWqTFGCj948/k0y3+IxZZtiXyeX3+nxRPM5r9bQHB+kKWsvUQg7cdrs3/cvsNarpqeMTItrtfEgR3X9UjWXIigDFoO3aHpH7dOFg9RsFjn3WcnidDZqWFfE+OJeZW68qN95WuDQhC77cwSACxqvIFWS12AfizpoZgYSn2e1dGuc93PN1loy16p1M0FrMiThzAH7PA4SxzTmtbVqVnOcPBsHYo4stexStidfbZuPhwFBbNu3tq4z4M21aiNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9mul3flXMx7uQ5T9znXvyXwzOT+EySBr0hbdE+UUtI=;
 b=UTxWH90G+61gEwKwZHzr8+E6X5igMbsmCNMP6/nmqmDCqhZAz6wq/Nt5V/8mQ75JS/ZyPafA0RHmliNoKR4hkB3ShrtOAusRnlNkX3h7vGsuwT5jZH83ViRz9UJSiWHTvJymUbQBT55tZXnabuRAPV8fsDeE56c787QiKKIMfHI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by DU4PR04MB12327.eurprd04.prod.outlook.com (2603:10a6:10:631::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 16:14:34 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 16:14:33 +0000
Message-ID: <ac49d3b7-2142-4974-8bec-722a98bc0781@cherry.de>
Date: Fri, 30 Oct 2026 17:14:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/faq: Add entry about emails on patch
 merging
To: raj.khem@gmail.com, richard.purdie@linuxfoundation.org
CC: docs@lists.yoctoproject.org
References: <20261030153308.3269691-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sr86nv0_fO4fscES2puqzkJ10+__rQUcJBbvTScsBsGRw@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAMKF1sr86nv0_fO4fscES2puqzkJ10+__rQUcJBbvTScsBsGRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VIUP296CA0045.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::17) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|DU4PR04MB12327:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a631a5-fc27-45dc-18d1-08df36a0e272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|261026121527099003|18002099003|261022105027099003|56012099006|261022113327099003|261021121427099003|261022075727099003|11063799006|261009223027099003|261028144727099003|4143699003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info: lAHYgqK7fgKDjnlKxIw7pAQ7sgDxP1mAm5vOSwIJpkktGUhs11xPzorvtqbPX7/I0Fgnd/rwsiSvAm4AqJJK4TGljgyVEF0CncXc0T5HqEGCYuKXYYk8ydDTDh07EYdfAgfn3IQLU1RBczVKtsdYDt5l7vpMoZ6riSZVpsGnBNwj8TUc/VazTDsXh6crvm+oOA4PF3PC93+Lmuy5wydwml/+VJAsJKsbcgL5uc2jqsnBhbAn7boBeUK+ihqj133yq8ulHNAj1F/M/nDNVFVJ74YBEdzvsCZr8JenyBR3zUU2PRVnHq7NheoA0ILY2fB83olDKAUVrohNjO9gmD9ad4159CfLcRdoQQ9uONEfNPcVpPZqEkCjvH4Widmsgeg3wq9C4enn87e1E98eli09ijFSER6EB+qtCDV2wYJnPcN3URuQurN3VAdsDW4tU1fvcs9VfWzGj38V5gjRAyZd26Nmf9WtSVgzF2aULZsvDZbD8TNCVmnJMqQrW199UruikzsUOJmEB9e3Z9kpi3yAdIeqMNA/+2ydS5Gm08Tbf9RVSthqJDkaQCxf4fCoxsIegmfRw+3ekbu2Izefds0R3Ys29Opzj3BVuW9pey0eNgfeI8i16zrK5r511pzWCF1xAd5NKnFxwgIOCNgYipKG1AA7+4bzmcC5OZe+kR6R7ak=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(261026121527099003)(18002099003)(261022105027099003)(56012099006)(261022113327099003)(261021121427099003)(261022075727099003)(11063799006)(261009223027099003)(261028144727099003)(4143699003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VcUcP4rYJ0iuNa1m2pEne4xjelyNDj6rA8iVKkWXDwtmPclwOz23qQGJ7e+h?=
 =?us-ascii?Q?f9NZOpENE/UczqU4Zb+mykJq2AUEkOP1xB9Qag16OzbLshoYRUMIYdGd/pTK?=
 =?us-ascii?Q?gLNuuYUt61ZndwFbRYVOZQL490kCw0xzbGrwHXd5iRTw/swjBuX5muHNvitL?=
 =?us-ascii?Q?imBIgVYMHKug/vQhYbWVPxTk0yusFV+GQy3bFxBp5P9pkmEq/6xmfC99iOuI?=
 =?us-ascii?Q?TpUCPVOkQn0mRIj4KZTxgu4aJARvtfaRUx2AwZz6OgiFGvQSVmNyqzfMuioU?=
 =?us-ascii?Q?YYLxVnRG0eZPuGIDXfrMIZDnjQrAbj/hf38bGfHWB7rhGPipJdc2sGDSBJbO?=
 =?us-ascii?Q?zRNyMZOkDmT9ywXnL01AHMi4/dRWX6CJeVQ2KLhtVyqEl9CtgbfcoSbxrnBv?=
 =?us-ascii?Q?E5Aj0bqdmbwS45/i1B8uW3/Bdz6qmodxr+MC4bs0kloY+0yhtIVVL8znVHXL?=
 =?us-ascii?Q?16Y2M08hMDiiQQlTCmxupYEtWT/kRNhX3JeDuvwgpV7EJVDtWJb/hzMh9Gk1?=
 =?us-ascii?Q?YIDRc7z0jAFmriMCztf6SwKIdw+6/og4wTJWvOz97XRqYaggyFiWOwWOLVpP?=
 =?us-ascii?Q?05TTrpXLYD63piFthJkt2eraNc+66Hb2pnXklY0qpLa/lERnfwFNTyUt08kh?=
 =?us-ascii?Q?RZ8EU1Y+5yDzUqFJ2TKRRNhQxjIGV5cBvFKwUaDqgDZufn7U1ZfJaiundm0o?=
 =?us-ascii?Q?Q0VnyCq17s+5Iy7V6Ap/a4hpap2+WigmDUXC+0WcG+bPwTFoJsRWUrh8Xaph?=
 =?us-ascii?Q?6BJtEX3euXxZTGDS7nPv0SdADzdsjqzxhBpxmP+BIQxTBef0nZBH5Z1FMqsw?=
 =?us-ascii?Q?JAZ/76zFaGRKoWSc4uhdB6cbtQcyIWhXD3lMDiMt4V0qMEM6ALLYEEwfESj+?=
 =?us-ascii?Q?+q3HRq0hHb6Icg7XuZ11sBcD0aEfRymGUzxRaCrYcC+oCCMBdidDHQUdl6fM?=
 =?us-ascii?Q?ZeGkTdeEEilys6y/kqmSqoNYDak9umyTuOE7r6fWzYW2lBjDXknUR7WQWyFo?=
 =?us-ascii?Q?rDutQZYSBHbGLo2ONElUMMiKkuP0xR9V5Sb2ACHbk4fR1dv/TiqH33tSPSnX?=
 =?us-ascii?Q?FtpCz9x3chUuPRVKRxXXnUoU2kT4GFHGD1ZgGUM5Il7nCm4ENULx8xLYcWGS?=
 =?us-ascii?Q?2NkmfWcW+ut76tiTkePA3vuL0o1K99xgOKEVh9oXIj9EbITbE15W/H9YwFvH?=
 =?us-ascii?Q?5CVJ8LZN+TfFNKzG3VVKRaNGWlTgkwCWrxEqdHUy5v02hf+0jrNxLuac2D5w?=
 =?us-ascii?Q?GAiSdIWAecCv4bGRQAycOYDqVbZP5d3I131ehIN4xEQu0Ti+CNEjQ249pyK2?=
 =?us-ascii?Q?EWSnBFsE7R0KqkJekV/+WCoUeePLp1TierxB9eQmaXOh1oWLL8KvK24ub2tU?=
 =?us-ascii?Q?qyYb7JyyqhTv+fwQxj8l5+LB/sUTqpRE4AW8ibnOjxJVZlu5Z7XTvCBlAzLX?=
 =?us-ascii?Q?0PwBk1caMImkSGz4Db2nM/Cjl7TRo+V0z2eU/AXcaQ09SG7I4IH3JqrBcZiK?=
 =?us-ascii?Q?JM7l4YhU+cH40nXWlhAQfWiKZFdsMApPt96lM/GTVhOXqdLO+IsOSgfmdcaX?=
 =?us-ascii?Q?OwB9ipD/Nuyu85aU+Lsgm+OJSn5yXCF6cJG1zcBr0DfXteyNWDtqWRBCgKqP?=
 =?us-ascii?Q?OXLPwdvBAq0+G+J+DsJ9Is6pBklddAaAf7Q/vnb56Kn744lT3FHPRnfP9AUm?=
 =?us-ascii?Q?Clijkbg2v2GPweB8jelG7JORki5C2sBJ6mZIAEhRWEamWKamI/09CBP0Trwm?=
 =?us-ascii?Q?PT1haKf97w=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a631a5-fc27-45dc-18d1-08df36a0e272
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 16:14:33.3349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yaT31i7HDWySm6VgkLL5DC0Nfc/YyvRrKmHAFZEqdE3WUk2gjQaHnb0im5OtK4km3Uwj1wpMdteEmowD1eBskcYF+yJO9fYqpR6zbl294Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12327
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 16:14:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10748

Hi Khem, Richard,

On 10/30/26 4:40 PM, Khem Raj via docs wrote:
> On Fri, Oct 30, 2026 at 8:33=E2=80=AFAM Richard Purdie via docs <richard.=
purdie=3D
> linuxfoundation.org@lists.yoctoproject.org> wrote:
>=20
>> Document why we don't currently send emails when patches merge in the FA=
Q.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   documentation/ref-manual/faq.rst | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/documentation/ref-manual/faq.rst
>> b/documentation/ref-manual/faq.rst
>> index 3646286a6..6b1707733 100644
>> --- a/documentation/ref-manual/faq.rst
>> +++ b/documentation/ref-manual/faq.rst
>> @@ -88,6 +88,25 @@ Our automated testing includes it through the
>> ``poky-altcfg`` :term:`DISTRO` and
>>   we don't really need it to be the default: it is tested, it works, and
>> people
>>   can choose to use it.
>>
>> +Why don't I get an email when my patch merges?
>> +----------------------------------------------
>> +
>> +The project hasn't felt it necessary to reply on the mailing list for
>> each patch
>> +that merges for two main reasons. Firstly, it would generate a lot of
>> email
>> +traffic with content that may only be useful to a small number of peopl=
e
>> and quite
>> +annoying for other uninterested people to filter through. That could be
>> avoided be

the last "be" doesn't make sense in the context of the sentence.

>> +emails direct to the submitter.
>> +
>> +Secondly, sending such emails accurately, takes time and it wasn't felt
>> to be the
>> +best use of limited maintainewr time. We do track patch status to some
>> level

s/maintainewr/maintainer/

>> +in patchwork and there is automated tooling which could extend on top o=
f
>> that but
>> +it hasn't been possible to fit that into the projects workflows with
>> enough accuracy
>> +at this time.
>> +
>> +It is very easy to check whether a patch has merged by looking at the
>> repository, or
>> +pulling and rebasing.
>> +
>>
>=20
> This belongs to openembedded IMO, so perhaps oe-core README is better
> suited for this
>=20

We definitely need this very visible (and the docs is such a place)=20
because I've heard again at OSSE at least one person complaining about=20
this (and I've complained about this in the past too). I still think=20
it's a mistake to not do it and that it's adding enough friction that=20
people aren't encouraged in contributing more. But I'm also no=20
maintainer in Yocto and I know they are overloaded, so I understand it=20
may be asking too much right now. I will not debate on the content of=20
this patch as it's the position of the project (for years now).

Cheers,
Quentin
