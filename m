Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03ADCC5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 11:46:54 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.111])
 by mx.groups.io with SMTP id smtpd.web10.11166.1709120808750489794
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 03:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=TtQ6dXgc;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.249.111, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvqRBNzkZNtoQjTNrPk/YMFKnS3MmJwpP51jqWhMmW5hznPoio1P6RsZ5gmRI8INh4zASlpQuV8RHqafRMVwMNsLgz14sCZeWXWLuR//2AaCt3apaXIakvg7TadB75JgI5UEa4bmFFBSsIlR/UHbraaRconx9Ed8AAQOyv8MMWv46XK42tkT5WJslshR4apVInUXWROJOHN98GvcMKltMaRXVDxem8ZfisGRtFgo9yeN8dybPBw0cYer4eTaltsx0rtw0cqBMVgXuL6yixjerwdPmEcV/Pcfn86EWbvFTkKpKAy1JENNfQw5R22lszA9RZDlBT/WRfxKk200DQbrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQAM9Z/Ad3PLFdsu23T46uFK2uE5sKU/Sw1ocae3d2Y=;
 b=c7xCeiMtxP8bBYeYhJIjITQRA9oOeJRV3NI2XUEShyCL43vPh76Zo5I5fDuV1dHX5lGxLXjzw2yX2RbcdSIoJOnsBPjhGyTS/ClGt45h+cWoDrU9CQUI7ZGP+gKLU8Qx/va5G0mGKEqI8SozJEOu2frFsJesbPdXevqwfcUhBV2L84PYeiUCtl3G6eA4aion7rQfKWHYD/81z1pERPUTbMNr2o1UnlTRz9KjAOmchb3NYd3+gioeDEy52fu2lRqigw6+deukr0QaxuJXhaDGqCFBAsFhP6NqzmZy61mYOweC4vFsUjjB7sXv8KP03Cu3V+zFMQpWa/KEMU2bVvUsBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQAM9Z/Ad3PLFdsu23T46uFK2uE5sKU/Sw1ocae3d2Y=;
 b=TtQ6dXgcvZ+52J9kAp9iKwPzMn9dliyBdwSin/yAJC+qW0Ff17amMAjIpZybl6nXGjEEhMbkOUJhVjSt3ch7iMGqM/XkpdywClRy/rFj/3Nj/u4m4JeOccWzjArHQ0LPDUHPLR5Ypw4KkPwI2aWu2bkvXgpmjUm/AF6N6JlKF3YxczszrkLYP0nims3HkycU3h/ppe3Y3QXWynZ/TlvSCdueBbqVphGbMH0V7qT7Bz78NU7MCbhfIOrTMeuJOgPV+ofjNEONsT8k/vW4CTtdukn7VMyx7Ud6RM/MfTyYlLZuGCRLXSyORLQIZEIDkRz0INMTQFM+veiAKp6bGz5S9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB7928.eurprd04.prod.outlook.com (2603:10a6:20b:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.27; Wed, 28 Feb
 2024 11:46:45 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e%5]) with mapi id 15.20.7316.039; Wed, 28 Feb 2024
 11:46:45 +0000
Message-ID: <f21a5175-3c01-4bf4-9285-3a1ecda302ad@theobroma-systems.com>
Date: Wed, 28 Feb 2024 12:46:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ref-manual: tasks: do_cleansstate: recommend using
 '-f' instead for a shared sstate
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240228-clean-tasks-notes-v3-0-368af5e1aa0e@bootlin.com>
 <20240228-clean-tasks-notes-v3-2-368af5e1aa0e@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240228-clean-tasks-notes-v3-2-368af5e1aa0e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::12) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6d8c8b-fbff-41d7-e05d-08dc3852f057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NJltGJ2aEw/P1l2OJKh3viYcBCQzACt+hHPcZW8FazGqpqxeCV70mOWYa0JLgsKRiWS5Q+NPRs+AKAhetRY5dmAQWNbCKDvjs2rdBrOfNWTVamq5+DIltgL+monuitU/4Wi9VrrBsOzP4gltQ9sqystEhpsDkYjvy360vWNdQBkmTx2YCMUHCRDLfJd8DnQF9+5KEo7JF93lX6kKrjnK73bRNbbBHBiE5Hub1lUzKJtSwURc71m4QrSBNjU76kdI4Uy0eOAqoT/nSrZBqXaqT7XuXkTkxNC0QGJ0TvD6BLIMFNzDZMwgooIOmumz80ON6Lz/Ln9MbqfDWh5ZkHz3J6maF2j1YloQXzBezhC/mf4ykQO6bDEWsxdqqZCBHRjrqHx1lfElaj56f7wua4DZTIcOSqDjlr1hPRz0WUIoRE5uOO0C+vVudfmMuaB/naGmB1IceWztOx7zPY5x8Ukv7AYYui/yBe7KN7YcCEp9QXI5cn7cjX92i1FBdLSC20donob2WH1+9WUSyCV1j83+c3fKfFbx18tanzHPN4iaBDABtwTCnBfaDZSd3pQz3F/q3Vq1GwCyiw2AYRv8AOldeQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0FsN0NpQkxCNmNkeTZ0UWZSNHcxdHVheXM1RHpFT0FzYkR2eXh2anBJNkk0?=
 =?utf-8?B?aXlxSGE0NXpGMmx2SkplMkJNaEFMcDRKZ09IenRVMjBMZmJpWDlQMU54RTdp?=
 =?utf-8?B?M1BMVmNBZ2xZV0pYTG94Z0ozMGRpVjFXME5icXZYd3dCS2dMVWRjYVN2ZVVX?=
 =?utf-8?B?amt5b0l2cDI3eUxuMWh0bGhQUUpLWTc0a3VGMWJZdGxWRlJXSVNBZndPNG1K?=
 =?utf-8?B?RlJ4OWFvTUE3WkN1SWVsOGlOTE8wNHRPVXNWZ2VBaUFWRGtGL0Q3TVJrN3dm?=
 =?utf-8?B?RkJRRG41bmUrb3NTZWNQRjlhWUhYT0NQZVhKMnhtYyt4aDgrQWVMb0U5NDd1?=
 =?utf-8?B?UkUyR215RHpoUGR1M2JZSmtoTjJtOFIrREVrUjhSM2xaYXFaR0kvZEtHbXFx?=
 =?utf-8?B?L1ZMdURPb2MxcGpsTFFkdUxnWFZmQ0VQOVZic2NUcnBBb3dPT3ZKL2FLeEpm?=
 =?utf-8?B?R2lwS2ZPK3JIbG42Z2thSU1pRUFBb0RNb0dEZldMcS8xSHowTjhzRmJmc2Nk?=
 =?utf-8?B?TXFhUFdFb2VSSGU2bWZ3UWN0U3lVK3g3VEJRQjhnenhLYkNMUHIvY2tJOWFS?=
 =?utf-8?B?K01zd0JzZFV4VHVDeDlHR2xWakZUdDI2bmpYVHBhVnpDcjFoSlJBWFV2b3JW?=
 =?utf-8?B?dkRGRG1SNDJXd3BudzdoakRPL1czV1A3N3FRU2ZmK1hwaGNtNnI5Q0IyK21N?=
 =?utf-8?B?SWFhZDJQbzJxQXpIK1FWUHIyWlFUVzE4dFVlclZ1K0NNUktoa1JQRFkzK20v?=
 =?utf-8?B?ZkZvNEhWS1BybG5pMnpFVUh6UHF2VGF2Zjd0MTQySHNtWnZuMnFWajZHbThW?=
 =?utf-8?B?WjI2V0hVK1U3d0RHRlo5YStMTjMvbllwTFA2d1FKSk1pWHJIdGR1dWQ1T3Ba?=
 =?utf-8?B?ZG5KMXA1N3BmTXdyNFIyQ1BJZVZsaUpoMFZ4V3MyS0xYaWs4TS9KQVdiYWpU?=
 =?utf-8?B?QUZHQ1VLS21oOGFuaGtJN25QTTR5SDhpUzdMNDhrdHNOZFVTTzg2QWhMQStZ?=
 =?utf-8?B?YVN6Q2M3U0ZrdEp3aUlldFVJSWlpMjN0bEZOWmhCZSs3RVRBNjYxbTlENW9I?=
 =?utf-8?B?bFFwU25XN2J2UGtNNU44Y2RsVlo4OFVBMTFZQU5qbFI5cGViWnIwQy80U1VF?=
 =?utf-8?B?NnRiSmhQdXdubTNhb1EvMDIrK3NLQ0hOT3FwT0RON3phQjFHZDhRR3lTNHFB?=
 =?utf-8?B?eCtxeU9sMlFvdTdCOHpwYnVUMUk4Qk53clQ1NUFTVVN1VXZjakMvRnNnbjFF?=
 =?utf-8?B?QVNPczFDSEtQcmxMRVEydzFhUi90c3N5amZKOUVVMGJQUlNlVWJMZ0V1b1ND?=
 =?utf-8?B?N0NSMTVJN0dVTk55Vk1aWE1HNDg5SHZVSUMxOWRDQzlnN1VUVUYvQUNGY1pS?=
 =?utf-8?B?eVBTMzZZQXFCOWNzbmxUWFZXSG9vRURubytGbFprQmFHSjBSU2ZrOGtQL2I3?=
 =?utf-8?B?STIxMHkwWER5bFNCQ0hYcmpGalZUaEJRTjVPeVRtdVkwSTJRdUp2YjFwN3dJ?=
 =?utf-8?B?WlRRNlMwZjZsQ1VBS1pmUENyWEs0Ky9OVEdNUlR5d1E4ekVKR0FHZG9IWWtr?=
 =?utf-8?B?MGt5Ri9tZWt1T0dEQU9SSE1ZV1ZLRS8rZzF1RnhvZkNFWExjM3dMbXZvY1FB?=
 =?utf-8?B?bjE2OENyM0I3QmJUVkhSSXlhTmRpSlBTeXFRaHRWdFdqZk5jdldkQWhzTklO?=
 =?utf-8?B?MXRDWnBBaEZDUXRyQWEwbnNMYWQxUHppWCtHYUw1aUZMcVVlVCtIcmFIZzlz?=
 =?utf-8?B?eWlwUTl3YUVqNzNxdlFBNGJGSWdleXJBODYwVjBWNy91UEU2UHJjZC9yQUh2?=
 =?utf-8?B?eXJwNmFkajliR1BnSFFlOHd4YWEvRWNtRHF2SE9qR0lhTEd6ZlRWd0ZaaWFF?=
 =?utf-8?B?c3hlT0U1bURqQlE2T01PeUM5UGJpaVF1WEVqOEg2ZHdDNm1oL1dUdGxJa25X?=
 =?utf-8?B?cktKSmcvR3hHb05sd0RUZ3ZtZDNnaEg5WEdSRDUzOW5PdGxoalljWkZ3alZ1?=
 =?utf-8?B?RXhuMHRsUW5CQ3c0elZFUlFsejhrUXJZOE9MQ0ZPcGc0aWhGZS9vRytkdWcr?=
 =?utf-8?B?b0YxNVRmRXgyWkNUVTBTL1JaOUpvL0E5bUZqR3djUy9XWmdqdWE2a05uaWl4?=
 =?utf-8?B?QXV2d3FJVldkNXJsWDgzQk51ZVkwL0NCUTBIN2J6dzhvcEhwM1g3ZUpvdk9h?=
 =?utf-8?B?ZzIyKzZwV1RPUDR3T3Z2NmJJd2w1dEVNa0lwL1dIVXNhT01rK3FiZFk0OFly?=
 =?utf-8?B?T29YUjdTaHBaaUdBTHY0UGlrTEVBPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6d8c8b-fbff-41d7-e05d-08dc3852f057
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 11:46:45.1717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vx27uCCrAQ8PNMf2ijhYdVprGuTCFcO4SKu0mgBEBOwJZWSz3wfVF6Jx7+syo/aTQIPDOKU52OcFa+FMP5N+ASP5Wcxk/fZbfBmYzGGWPyQRUj8bjoDRw1b8XnT9qBVk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7928
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Feb 2024 11:46:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4915

Hi Luca,

On 2/28/24 12:25, Luca Ceresoli wrote:
> do_cleansstat can produce build errors when using a shared sstate cache.
> 
> Add a note to clearly discourage, provide a safe alternative (bitbake -f),
> and the rationale.
> 
> Proposed-by: Quentin Schulz  <quentin.schulz@theobroma-systems.com>

In poky:
$ git log --oneline --grep "Proposed-by" | wc -l
2
$ git log --oneline --grep "Suggested-by" | wc -l
46

https://git-scm.com/docs/SubmittingPatches#sign-off also only mentions 
Suggested-by as a trailer.

Not really important, it just surprised me to see this trailer for the 
first time :)

For the whole series,

Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Thanks,
Quentin

