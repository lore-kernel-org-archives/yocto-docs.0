Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14917C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 10:35:57 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.138])
 by mx.groups.io with SMTP id smtpd.web11.17949.1713177356339769624
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 03:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=dFKYZHOI;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.15.138, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kC+XJdC8FnHr73rRA/iTQMaAATg7VRy8NOxO04RWjF5foJpwkBQEvq7bXifc5ShBpqvD75ZecOj9y5CUMxzVNi+crmmxkemCPPakcZ3HHfxvh1h1WW28IjUp7kzdu9kSp0pnP3LSW8VNutd40p93NQatN7puGh+SK/E53/yLDBxhlwt1XODRp9mXeNlAvn0wqDzdQ3M02QiTQGPFU+lXc9cLBvfW9Sv72SmOtKrAX2GkhLp9qNgs3bkcPWu0PjpnUtGB9fVhmw8JTgjc57zuBGh/KvFze8QBLcQxdIKE+C5XwlO9WT5azKfypaD0ew3I2gauYPUSGJNFQQglh20WqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=II4PoFauAYqTkVr7HgvthqMfkj4mPv7TSnootnKzAIU=;
 b=FXgb811pLN7ElZ3AEBQ+/AJp1k/9cgnG+++oo4DxV0b3WZyFAlWZ8swdMP5CwvU0FnDnEJvG/gpfep1UYcPsDizLFJEwH7RAgcnPaX7c2Kww9YXti6o27i1iIJS7KdChbxGQThD8C+h97fC4DPKty9jkUyU2fjfNY1G5Kaoh9HwXu2WSHuoqSHECxq2y5XMe0lPBFeiMoK0TkYoTr+vkNH5F8kiJL1q0jEnPwUiVdfG8MJ7o63QAvdzqOQl7d05f0Zq0lJ4VXamIdZNJnzI6UIqDJk4Q4mbG73xzwnsn3LmmF+HCm1mc6aaLgm+cvt0d/UzKClCEf8Hucg66Xwg0kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=II4PoFauAYqTkVr7HgvthqMfkj4mPv7TSnootnKzAIU=;
 b=dFKYZHOID/4hLeXxz+oaajXBNUkaFo/vzhkYbXon4W1slSBWrbdfQ0BQS6srlkYmwPjE3f0rUbb2bq/reThKW9oB3ddYkvXCADddRQGndJEuahIu3mrzNpDzdlYiRvFyYnMFnqVx14oIi2JnmBSlU27T+87B+QWzjnACD0rbWpqsDe2/e4bYPcqWyTQvgU9er3jGOm8ofMnX3xFMPYndtVF0+AqrW46Zfu0wZPK/hDfvLCoJB9/hGmX47ZNtfLpK9zjFiyC8R8AaDJ2DM1er+39KK9v5Tp+Ap26RAuw7azlAwBJErqx8F6k+qRE9xURrKfRwYncQJJx6bHEfzqGyRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by AS8PR04MB7638.eurprd04.prod.outlook.com (2603:10a6:20b:291::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 10:35:52 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::bdc7:4b2c:e74e:1504]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::bdc7:4b2c:e74e:1504%7]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 10:35:52 +0000
Message-ID: <2f540686-d854-4ff0-88eb-36bd80c1cce8@theobroma-systems.com>
Date: Mon, 15 Apr 2024 12:35:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] manuals: standards.md5: add standard for project
 names
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: docs@lists.yoctoproject.org
References: <20240415100555.1054695-1-michael.opdenacker@bootlin.com>
 <44ff31d4-4100-4f81-9421-6b8743ebbbdf@theobroma-systems.com>
 <efc44689-a0ad-4f16-b0e8-441ef17a6cd6@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <efc44689-a0ad-4f16-b0e8-441ef17a6cd6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA1P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::28) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|AS8PR04MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: dea2130c-3e16-43e4-2b81-08dc5d37d2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ECK/ne141JxGCtHUuq0qqFwGGgmcAz1vGxBwrSuOJMqFcm375q6OEunogSsu38CuccVWTNvQ8Q6KcgOxrqgL9iP5fagzOEs3UEEOtBHUPsZaezpIFTJdAUH6XT9L7NaVJqGyS5PIi+ugJzUgvCK71qySKoZNmTR1z4pQOV/YaRzy2vcMMRNMGp2eGPrKa7Wh2IvSFX5sTLy7aZd+jMtlcVSyqq/uoyCUYtJVTlWKLBL+Nvg7yzS9RXb8T/nu9Hubmivd3Wl/nV8cjvMescoquRlhkBNkk42EsP2fQQUxs4Ra852dzFmJGmiOMZKuqfOYaZQ2pHgbHC5WfCJPf9AmEweADDzMIpMRRDd0tNo2NTloYJR0CvtRxo9GQ/wk7YnCOc7wTArXlDNoso87joHM1lh4EaFrMP/Q5Qw9phrDwXqJ3rJ6uR4y0pUifG7bFi7TAC2065Hlq9mGWRD1kzBj/DiD0SK8k3ijCyjxHz52Ayjm6kjeevR+bXX21qbkbTjrP2ZonIMXIpbOM5Ub+Tq59Xt661/xPUJXMnbVZgynwCw7yskE4bmzZECweMoG9dwKVR/8ICJIzeuI+Aqp1p6s9tgr23bPynUjoQulI9fT/2peuCkRuJwmv7cceQUUfSNJ2+Gi9EL9yuamw8hbnOaB4ohz7ge/1r+HocJs60csgII=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4842.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UQqXe76OsvFUaEQklAbCIalvg7cd29ffKuau2w9HqBuFjpSgHX2xQiuPxxUx?=
 =?us-ascii?Q?IIbnhXfG/NFD9PDAlJwKy86r5wQQE98h53bCiN+EG31tGZbIV/Ag8UNLe4ns?=
 =?us-ascii?Q?tilrRP4rqeKUijVkQqFEhIYhGkSWEQyDmp7YiepyPZB/19ExxsvqTPReypUV?=
 =?us-ascii?Q?rCFBV9wwGj1pK9uwq/weGtKoMwgoaZtGfdnWPFw+Y5x7nnCq3gmklhCehDxg?=
 =?us-ascii?Q?ouUW5Ynmec4AsJ3gkR86C0BJRVq27eJIEzwDLyjQ2n67gOJrM2DAhj17MeGI?=
 =?us-ascii?Q?DaY/OdVLe/nHW3lajVvGUYCrGI4/wzcSBrnEcnHnKa2y9IIRdpDyYCs4u0Lz?=
 =?us-ascii?Q?hKpHLxSsP/L8pC+48TnWaSUCNg/BZ1TlVMkTWElTXQESpE324ue3sgq5Edf0?=
 =?us-ascii?Q?/S245JuO9OiaJvHjJhBU6wkpAT6ORFgQlZ1Y0q2jaYAR/3Pu/I9mn/CfPxb+?=
 =?us-ascii?Q?g4rZygGH4N9IidrpTjfvW3o9RHoKuaDDPZCehfkelfvDhH8764KE4/QkvjfH?=
 =?us-ascii?Q?GKK0KPgXjRhxAzNhOYymOCWcyGRHKehyVKy8PL7exDblmaPV+bYq3dDyPoH7?=
 =?us-ascii?Q?LiKhvLGiNmW8OBobhMYvPJ/aUOUGzEjj4SWSIui4VWMzK/4Fch6gJIdrfjjv?=
 =?us-ascii?Q?YkzEOKzBuqbMTOgFJ5wEgHp7PnVZHglTtF6Zahe3exYaXwCfaU6MGMRyVwny?=
 =?us-ascii?Q?vCoaIsqvky29NAY4uoAU3oPkxbrIt5b2PWppH8sXTVeDoi4d1CAvMRH+0oWR?=
 =?us-ascii?Q?KdcHgWDguSJ4DsW+RL2SgGvT4N0zHM2wg8wCAJKslBFMCNlaGSa07GViKOTw?=
 =?us-ascii?Q?JB2U3QkxXM38ySs+/RZ+90PZUBzimMdjM29lIEWSAmbFW8EX3CLjQuhkowA/?=
 =?us-ascii?Q?wqUy+hcguXYCa7bc9FhZnxfm+ym2ZSL2RPW6ax7C7d1ivEA5jPCuVAnEIV/q?=
 =?us-ascii?Q?KT74/eIgl2BjvJCOEHyRRtd5pjps8HWs+krCkxuW5958O17tLpN328GThfi0?=
 =?us-ascii?Q?SzRSdY5hbxJ7MXJlTj2nyhvlAjDgQQRGEpfPNU5JPekWudCXDaIbRRQATfOw?=
 =?us-ascii?Q?FEovqlRcR9Fmaw5o6eIP/JBq6m8S2EAL+AW4UC/aOsbGQD1oPIuB3ipJ+VRk?=
 =?us-ascii?Q?uFH9lcMmCNr/XVjWTczdjWCjwnYgSjI0MMwI8YqGlVOK2RQBRBdT+c/Ykctq?=
 =?us-ascii?Q?UnTrhrutaHExPAIercLrs/56//ZBFzdaasKbMCt0qxQQCBPVviXqmNXhQDTk?=
 =?us-ascii?Q?qTuIKyPB/OPZaflqXK9vVZc0H3vgjct0szXITe4jWbXgwdOMmE5LZdJL89px?=
 =?us-ascii?Q?Qy+g4AwX+9vI3w0bfX7a+sGYRX/XyyLMXW+6BMUnsht3GxjRgJl/dqGB4CPh?=
 =?us-ascii?Q?TOTDiqPfX8dl4uK0XLng8AjFXu/n/rkC35DLJ4Zd6DDaLu90E9jyMrdxEHdx?=
 =?us-ascii?Q?6unNZjJDDP0INnv5/mrsG6eL/2k5i1s5KI2JXoGk8RF+ZU6zpWx62B3JMGyB?=
 =?us-ascii?Q?n0TxgDex23E+N6Uk1iISnKkPjYe5Oe8dcltp7NH/rfG5y99W8XhbB/0B7p7l?=
 =?us-ascii?Q?AU+f+x7324CoJE5X26gJgqMVMjrhnp0R6Je912pUuYGkW9enraIDC/sRmn5g?=
 =?us-ascii?Q?2Mvukcz37eFCm1u6uGTw7dw=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea2130c-3e16-43e4-2b81-08dc5d37d2b1
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 10:35:52.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: titc37391nJg62DVpMHW7/ZyQ/TO5kP9BorHBEXIGVP0PcNWgLXbatOaVE7dr80r6ot0ACK5ma2n6a4wS0bf03I0IZWFCvRUZdonqJAlKKtXfBR4bLzUJDBTtqXqaM42
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7638
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 10:35:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5149

Hi Michael,

On 4/15/24 12:30, Michael Opdenacker wrote:
> Hi Quentin,
>=20
> Thanks for the quick feedback!
>=20
> On 4/15/24 at 12:11, Quentin Schulz wrote:
>> Hi Michael,
>>
>> On 4/15/24 12:05, michael.opdenacker@bootlin.com wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> Set a new standard to introduce project names with single quotes,
>>> so that they appear in generated text with an italic font,
>>> to make them easier to distinguish from command names and from
>>> ordinary English words.
>>>
>>> Rework and move the standard for command and file names
>>> to make the whole description "flow" better.
>>>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>> ---
>>> =C2=A0 documentation/standards.md | 31 ++++++++++++++++---------------
>>> =C2=A0 1 file changed, 16 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/documentation/standards.md b/documentation/standards.md
>>> index e0c0cba83c..05c5afffe8 100644
>>> --- a/documentation/standards.md
>>> +++ b/documentation/standards.md
>>> @@ -70,27 +70,28 @@ cannot be split without infringing syntactic rules
>>> =C2=A0 or reducing readability, as well as for command output
>>> =C2=A0 which should be kept unmodified.
>>> =C2=A0 -### Project names
>>> +### File, tool and command names
>>> =C2=A0 -Project names should be capitalized in the same
>>> -way they are on Wikipedia, in particular:
>>> +File, tool, command and package names should be double tick-quoted.
>>> +For example, ``` ``conf/local.conf`` ``` is preferred over
>>> +`"conf/local.conf"`.
>>> =C2=A0 -* BitBake
>>> -* OpenEmbedded
>>> +### Project names
>>> =C2=A0 -There are exceptions in which such names can be used
>>> -in lower case:
>>> +Project names should be introduced with single quotes, to have them=20
>>> rendered
>>> +with an italic font and make them easier to distinguish from command=20
>>> names
>>> +(double tick-quoted) and from regular English words.
>>> =C2=A0 -* When referring to a package name
>>> -* When referring to the corresponding command name
>>> -* When used in a cross-reference title. Such
>>> -=C2=A0 titles are usually in lower case.
>>> +They should also be capitalized in the same way they are on=20
>>> Wikipedia, or on
>>> +their own project pages if they are not described on Wikipedia.
>>> =C2=A0 -### File, tool and command names
>>> +For example:
>>> =C2=A0 -File, tool and command names should be double tick-quoted.
>>> -For example, ``` ``conf/local.conf`` ``` is preferred over
>>> -`"conf/local.conf"`.
>>> +* ``` `BitBake` ```
>>> +* ``` `ftrace` ```
>>> +
>>> +An exception is when such names are used in a section title, or in a=20
>>> cross-reference
>>> +to a section. In that case, capitalization and quotes are ignored by=20
>>> Sphinx.
>>
>> Looks good to me but I'm wondering if we shouldn't have an exception=20
>> for BitBake and Yocto Project? Those will be extensively used across=20
>> the documentation and I think there shouldn't be too much confusing=20
>> about the word (as opposed to some other programs which mean something=20
>> in English for example, e.g. `perf`).
>>
>> The idea behind this is that we'd then have an exception for those=20
>> words in Vale and that would help us catch typos and have some kind of=20
>> consistency across the documentation, without having to check manually.
>=20
>=20
> Right, perf and ftrace are typical sources of confusion. I agree with=20
> what you suggest for very usually names like BitBake, Yocto Project,=20
> OpenEmbedded. This could also include frequent project names like Linux.
>=20
> Hey, a more relaxed rule could be to only use single quotes for=20
> uncapitalized project names, once again such as perf and ftrace.

The issue would be the same if a capital letter for the word is expected=20
in a sentence. e.g. if a sentence starts with `perf` all lowercase, I'm=20
assuming it is the name of some piece of SW. But if the sentence starts=20
with Docker, is it the name of a piece of SW or an actual word?

> These=20
> are the ones that can be harder to distinguish from English words. On=20
> the other hand, having all project names=C2=A0 (like Docker or Toaster, w=
ith=20
> the accepted exceptions) styled this way, would make the distinction=20
> clearer to readers.
>=20

Mmmmm Toaster is a good example of something related to YP that is also=20
an English word... I guess all project names highlighted would make=20
sense then. We can always try to have some elaborate sed/grep command to=20
find Bitbake/bitbake/bitBake instead of BitBake for example instead of=20
relying on Vale for it.

Cheers,
Quentin

