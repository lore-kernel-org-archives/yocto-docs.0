Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD7DC54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:31:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.109])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6626.1785223878981780268
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 00:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=nJyMRaHM;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.162.109, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rm5bSJNPGsiHnykMbYFiWZlyopdA2nl/Au2o1S3QKPRPufFk0TTl1rjrkBEFbn0z9gz4NKTrEdE+ZPyqofi1OsXGVGOYP3DjDOuvEODcLkpG34rhDKEBToK4I5hU9A9Fr1AVoabLAgS3PFOVRfqWbeyTZGe1647D429Kh9VvW8kxLrOKkAgg3wdF/ONJopEJG2YczhtZpPwt4bVr91vShxfUce/BSB92vmUFemW426bUA2ImSPvl7lzuat4Uf4QzUnQQtVpXCIv3SfLGKGwKqpHPjrPI2MikhWkaD69isPP47jJk0YpfZiuCl3mkWTTTkV4cLQZYa/0AoaZX/dihrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RDIBBq4VYaqoicLFRRxNwRXrCxck/lU6iasrrFKGaU=;
 b=aP8J+ZUPk6A88DcQi2iS0jsdhK6KFw6o892aXnxzZyEpCG9SO0Re4MOXQUPOAkRi3FCIZ85zEXwAXqkLSJHVCLHQ+eV/N4rwhu7ahcum+GYTn7xMCACj/Zdb73Y72ps+jPMTbhHD7OSvTBwlmK9GJ0QmEKf97V1li7kx7ce681Wc35FOWMBEKwOe2nulqpldv+5TLWEQ+5Y/hWWJeo061noIuM8Bop1A4j1tUbelUZZcx20cUWY+KhfC7sRfpknyk54XtSsna4RiZ7a2HF3urNnUP/p5/gqvfK2DRY6mW7KIYzGDimok+3RAXC7iqSBlOzOca+Wk+igDxHVX628PFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RDIBBq4VYaqoicLFRRxNwRXrCxck/lU6iasrrFKGaU=;
 b=nJyMRaHMDva80igbmuBFFmx93CT8JwBiCOObI16QP/RIP+GwuAODX8fhNxp2RakoUNz316lXtl64KJTZ6w4e4el4FVjIyHj5NxgPh7kY+ZpgymvYxZLRENpdt5H8o0085u6n3/cGZ1eod1/XrEXtSnupc2ax/eXMCiWuvgyBinZR29pwIzE5Ih998C6c4InPX9aWdmEDW+UCkjDDcRSnM3RlGmGDxuB6xRQws0E27MeXUqi5l00GsrLTua9fswJeWXDbv3xwb+kOSJaH1JffLmsGhS8e4/y/vGowQkoBT3wCgAxR1lm7w/aQcjStd/yG2WS5zqaRH9i9PCwX4PaYRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AM5PR06MB9896.eurprd06.prod.outlook.com (2603:10a6:20b:6a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:31:13 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 07:31:13 +0000
Message-ID: <dd17aa21-25e7-4917-bf83-2b1e5f582d08@vaisala.com>
Date: Tue, 28 Jul 2026 10:31:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 4/4] recipe-style-guide: Prune unicode from code
 example
To: Quentin Schulz <quentin.schulz@cherry.de>, niko.mauno@iki.fi,
 docs@lists.yoctoproject.org
References: <20260727163529.30595-1-niko.mauno@iki.fi>
 <20260727163529.30595-4-niko.mauno@iki.fi>
 <9a62ad9d-24db-4f87-8c7d-82e1e5d6f6ea@cherry.de>
 <18C65F1BD66CAF24.3010641@lists.yoctoproject.org>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <18C65F1BD66CAF24.3010641@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3P280CA0036.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::23) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AM5PR06MB9896:EE_
X-MS-Office365-Filtering-Correlation-Id: 22bc5ab4-ae4c-428c-f2e9-08deec7a33a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|23010399003|1800799024|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	ea2I9BNNq8TxjxsEhW/EOE817R1pkDer2IKtl43VrI91P1pxlIbd8A7f0uSgp+695tVQIsPolfWNs/0NNL+1+HK6Av7GXfMkKbyDYUq7m0Pv7NOTYfHsvOW1EXDZlJvgWRT2II1MlBGA1PzAc4QEBxWmwmLyqVTXRbBvKqOx3W2A1nsOUj/ymVzQGk83s93t5Eneg5f2e2uPQCfz8aTrygwzTKBhWq8BYidcx6OQVrXW1tuePuo2wZoRim3DVgg0W15/Objfu/fKjSsP7oi+Cg5tod7g5sZhhpbO1XMVbbPEKmPWTmsOum5h/Y+I2jMsBfQ6drMkAk2Y5qqCNdt3qGYasxkZwYNcPjrpGDsoX41Ad6i6D8pv9flx9eOpzdgfnNTEUVUv4BU6X1u22Y4o89D+7sN2pwXsGoRjH/D1oIzEAJj9WMV75Jda+961YinHW4GLHjAyq1cO7HQTilgz1HUiKMQdC0xKJQqzM8BJQWDKrVBf5engdjue/vkJ6omsvEdWaSK4aA037v1H3UXlfFk36N3DmxQ8C4hr9lil49vePqsvdMWTXR9RYAot7u9RbTTMEnSXktWMGAwcuEDcoy7tYgmeBnVoTW461zV53Jd88JfYPr6xMQ2z2IeS6tkuqD6EtLgIc+TUTCDZ1fwz3IZHTMgwdac6omwzunvlB6w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ncsi7eB/GRqrGQFNLlwmnCAtUnOtCablaKxPtYHTvdyraq0wFsJ0t2Ucg2ON?=
 =?us-ascii?Q?vecWHKTSZauY5UICXBIWyFAincNCnRf1ZuSK1mmqWVtcf81ZlH8KkWgsoBNW?=
 =?us-ascii?Q?+4JSjB83acgFbKv7FHvvjXRB4lNEMGXRWDjhHQxWpHwB82NPBMmwiBRsdZ1r?=
 =?us-ascii?Q?xqG61QpThU1Qm7euch5rVzkEv6Md2LqmjrGjLwtuINpr4LEr8EPG3XC2bImw?=
 =?us-ascii?Q?vhrW2RRlMErh3BFRBBfdkL5P76W4lTCB7+I6pAkA5/Puqoxofb80bTdI62OH?=
 =?us-ascii?Q?zbYGXzQrjyyLtp9bKw6jj4XNuR7w6sJtjPYJKk8I3wVbapUqIIqdtS1ZnTVQ?=
 =?us-ascii?Q?/NXg8Xw/9KrCN8RCkzQozrBbf8fjslfbGgM5YxuuEbXJIEwgY3BtqPSj0koh?=
 =?us-ascii?Q?zEVANHirYOl3wvlubu8dmZTSCVe2t2KTzV/KAOnwceOep3Ow+IR+3grf52Eb?=
 =?us-ascii?Q?7vQ9p5NWmhIA9TrhFWiLsFRl6XwrfR1X5ZPdXGnXIjx2NZIFITdX4omL2AKx?=
 =?us-ascii?Q?GuMxUSA6+Uq0WFOrS1VoVu4aLcFTWA843QCOw32FQqi4pO8ZQE+Elxc5ZqeR?=
 =?us-ascii?Q?tKX/0l3GUIPiJfdF9dFoOWYYiaxamRDPf0hUxEcZA/dEaJfsh4aiCrHGL7h4?=
 =?us-ascii?Q?tE6QOWxn8EY3FsoQteF1syDEzxXQAjM7Hj2C8e87bUjMnVSOu3xaczllIUGE?=
 =?us-ascii?Q?JdmeIR7/A3HYraJ1+wToTtJCqOi6UITuR3ZCL1BwnSuhd+ORqGMutzzsZLO6?=
 =?us-ascii?Q?xUk5/cs0EjVDAz6MUe31cZC+8mYTaV3f+ApQuL1QaKQbD5vkfSxopwJzrzLS?=
 =?us-ascii?Q?iIwgKoLeday/z5FNUi0FWFZJglcL6a8m+7GFMS9G0kI/M205LQyf6ruJ3tl1?=
 =?us-ascii?Q?9Qw1xuM0Y3lxOaRKVY5F0UtRi5xCf0jYUvqKBPjg/eyhNihZeVsf3K6OAGja?=
 =?us-ascii?Q?zhdaVRN5JsRaahxeqMeywBEGk6ut8kXuxkRQUkQtp2Yb9QOnNv+wl6DJh0FA?=
 =?us-ascii?Q?Hvvh4wayYV3rJXmlJupFscUHSX0MpfCEyw5LfHPh66AX1w9axpIcUZTT8d/6?=
 =?us-ascii?Q?zw9hhulOK0OKdjYIaH6Qn1ZIs6hEj44FqUHC86JwXW5KETOsadYHCWAhdHFo?=
 =?us-ascii?Q?aUROsxuQ3FkMhkNrTqqeMLCLqngyCfPaTefFBfTH4kwDEIbYrsL3u/ZDwuu+?=
 =?us-ascii?Q?BxTPYd+C5MPjrr7eC47mnQR5pTqc5ahUFx0M3SMXvmBms9sYGZrxMLbIO2d3?=
 =?us-ascii?Q?P3WDicHvdv2FbVKgOCJEVmHXXq0BzS5NwlzABgThOgSKEbS2mvIoMzT1Jaxs?=
 =?us-ascii?Q?441b6jGLVYyOBVbLdZmFxc8ITd0QBk4aCk9wnLLCQY2gZPb0JzlfEVZVZ6k6?=
 =?us-ascii?Q?Vwzgegez04kz1nhNGrxSl2RP+7b5c1nV6yyMFt0mq78i1ikMsuVV17RN3jHF?=
 =?us-ascii?Q?pp39G0xt9HoYwbjmC+fVg4eOCsuxDi/nDVkz+Nj3Sx0YULMf5Gctb0CVSRhY?=
 =?us-ascii?Q?vWvCJUriE4PTEpGygQ67Sb6aCVN3ojMKj3sJHNVUEGtRlpn2yZSflmzWM8xx?=
 =?us-ascii?Q?BAIrdPFiiWfcrqXM0+TkhubPcB7U6rG01jGYsBkSPmrMIoGvEzu229C4qDqu?=
 =?us-ascii?Q?77ad7i4/7uRaObxn//p72BZX5jbzViM1W4/6tV81/77iEonX5n+0qHhkTzZh?=
 =?us-ascii?Q?hHRc0nD+TyBijwthFHTgRYZ67Tyjerbn1Xiet1Ub5+wQNuiT1nZi9KN3mfxK?=
 =?us-ascii?Q?vRQM4caitegZpOAje+kn1ZmHp2iocOM=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bc5ab4-ae4c-428c-f2e9-08deec7a33a2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:31:13.2868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JqplX8sBcbhAdBqWqTMBMsCUXYtWRJm7tucxBLlB0Fr8sQD0c9jThQBuWXPZGV+B+Al1vjtUcNSnkC/1UsWhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR06MB9896
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 07:31:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10160

On 7/28/26 9:07 AM, Niko Mauno via lists.yoctoproject.org wrote:
> Hi Quentin,
>=20
> On 7/27/26 8:18 PM, Quentin Schulz wrote:
>> Hi Niko,
>>
>> On 7/27/26 6:35 PM, Niko Mauno via lists.yoctoproject.org wrote:
>>> [You don't often get email from=20
>>> niko.mauno=3Diki.fi@lists.yoctoproject.org. Learn why this is important=
=20
>>> at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> From: Niko Mauno <niko.mauno@vaisala.com>
>>>
>>> Copy-pasting example segment containing unicode characters causes
>>> breakage like:
>>>
>>> =C2=A0=C2=A0 ERROR: ParseError at .../foobar.bb:158: unparsed line: 'RD=
EPENDS:=20
>>> ${PN} =3D =E2=80=9Cfoo=E2=80=9D'
>>>
>>> therefore replace the unicode characters in the example with regular
>>> ASCII characters.
>>>
>>
>> There's one additional location where we use those special characters,=20
>> in documentation/contributor-guide/identify-component.rst, would you=20
>> mind sending a patch for this as well please?
>=20
> Certainly, I have now submitted a new patch for fixing that particular=20
> issue also
>=20
>>
>> I think it'd be nice to add a check in pre-commit such that those=20
>> characters never (well, if one runs pre-commit :) ) make it to the=20
>> docs again. Is this something you'd be interested in looking into maybe?
>>
>=20
> This sounds interesting, let me see if I could whip up such new pre-=20
> commit feature with LLM.

Actually, I've now submitted a v2 series, which incorporates the commits=20
I've submitted since yesterday, along with (LLM-aided) check-confusables=20
pre-commit hook and additional unicode clean-ups. I hope this helps,

-Niko

>=20
> -Niko
>=20
>> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> Thanks!
>> Quentin
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#10152): https://lists.yoctoproject.org/g/docs/message=
/10152
> Mute This Topic: https://lists.yoctoproject.org/mt/120470254/3618471
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [niko.mauno@vais=
ala.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


