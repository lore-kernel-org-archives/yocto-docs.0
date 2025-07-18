Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE55DC83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 14:22:43 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.29])
 by mx.groups.io with SMTP id smtpd.web10.22110.1752848557127616737
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Jul 2025 07:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=d8jJat46;
 spf=pass (domain: cherry.de, ip: 52.101.71.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CICErwKZSSyv6x2fPAuAI/Lc6vmLVoyTmYiCPu9SHcgk1npDpukoR84sIC1qNm2scgmFKEcAVtBLs7iYmo0ofR3fwMttaKg5hRQORI/V81XfHSr/0MS14sldGiWOGj4lH7sq+X11TJMU4aYJo6W1ExPml6Qn+i4iVaeLaY7XglmPilRlZ3IN1n/LHGQz9uh5VJd4qOaOzQhDM+AbY7B97UjWVMMtIPEz3RHnQuwAlRQEvg4DOZSQNyOyk+EZ6crk6VcjDg4+sy3H36FEuxleF6hL8dAAC9H/2SCOZAIgNpaad0LsY7/Oa7q758aWY3mZT7Up0UAtjevJoE98kiTqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bON2MZw1Q2iy5PSyKXMwOsHDU3jV+Kkls85NcSItguY=;
 b=lGSao+DjRXsPrtB5tJWK6cUAIPiZm4pbDPGzfHOMbvUPD84l2PrEE3KKqMpVf9h58h6OS/pq8lkCQC2Dc/f8HXZDMhJZJ7d9SNLYHDkVr+YZMkk5RrsoVfPQXMjnMSLlUAKq+b35qqE69mG5VG4NEM9ETAiTpESbuRrGQNx4jz9nAdM5b9bSdRfxesDqh/CsZ/FGFI7r4C4YXjuxOHNBaQEYdo8UpQYiShFF5533K9mgVWDjzT6ztfUqbLp2m0ZDyGpfmTsRJW5nFlt2/Q3TXjicutgzfW1mubR/f8dxDJhloYLWCMnknC7wm5sUyIjVTYdSQyiTrTve9jBC5xF0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bON2MZw1Q2iy5PSyKXMwOsHDU3jV+Kkls85NcSItguY=;
 b=d8jJat46FRZYRtO5V1d9IK5AxHoXdcXsQAVRK6khX+FK6kXRGStwF9n7Lwg0NkcSFimP83WIgA6y+yvrpCEVrxjRKTdJbFWlht1xoOJGLEMPe+y1LKLShSDYbzk1FNXpeuKsTMnBqBeEbjRA4fhtVjUzHxAilG1Qq/wltyttoVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DUZPR04MB9747.eurprd04.prod.outlook.com (2603:10a6:10:4b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 14:22:32 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 14:22:32 +0000
Message-ID: <067e7f70-651f-4c71-ace8-1add64d90144@cherry.de>
Date: Fri, 18 Jul 2025 16:22:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: document new toolchain classes and
 variables
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250718-new-toolchain-variables-v1-1-28c6b7054f73@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250718-new-toolchain-variables-v1-1-28c6b7054f73@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0153.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::37) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DUZPR04MB9747:EE_
X-MS-Office365-Filtering-Correlation-Id: 253a644e-4398-4ec3-2787-08ddc60688c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OEtxQnpxNUg0d1VFN3NmYWNyL3BrdGsvVjM4NHVVb1UxMlJka0xNN1AvSUFu?=
 =?utf-8?B?ZDYrZGZLVXdNd1hWSGFwU081UUI5WWFsem5PTVkwYjBkMURsOVJJeHlDWSs0?=
 =?utf-8?B?NGNUWjJyRkk4YVpZL0FjeHkrQTlueVIzYVlIZ2FiaTBJVjlLREVYTFZVL0Jm?=
 =?utf-8?B?RHlxNHFFZzV4UlFVZlZZVTRzVE1PemdpU013RTR5T0o3VDEyUm1KVWZRUGhi?=
 =?utf-8?B?eUNES3FjMjhqa1RzbE9PYjUrcy9pRlRXcWd6ZXZQM3FPaU41SlVuRThDMGtz?=
 =?utf-8?B?QThLcUczd3VKellFeTBzdmphc1VpQm5Oa3VXbEpxLzhZcXZkNXBFL2Rnd0Jz?=
 =?utf-8?B?YkZNMWNNakUzTHJuaFBTK1ZvcXAxRWlqNWw3MWhVQktMeldiZjRGR25GNUVV?=
 =?utf-8?B?cjNEaTBuRXFyRDg1TjNwaDFvbDM3ZUR5RUhnTnJMVnVva2EzSEFadnBySlV4?=
 =?utf-8?B?amVZck5WU0Q5Y01rd3pqWjR5bm9hOUEweUpCcTRJWE5NMmRjN2hQekpmNzhq?=
 =?utf-8?B?QUJHYi8zUmU4TysxNjJHQkptbzBnek1kQWwySkJEaXJQd3hBMkZGcVpXM2lT?=
 =?utf-8?B?SVFzamVRMmNoWGZMVzQyU1N3aExUZXJuTk90emk0RzNQU0VWakxFcE5LazdT?=
 =?utf-8?B?MGtUUDJoY09aLzVucHZFL1lDcFBIeEp5ajZWZ0NtTnJjV29CQ2ZSZWFtM1pH?=
 =?utf-8?B?OTdMMkorWDh1bkpsdy9RVUx2ckVFbjh1UFZUdExuZmxhTWw2aFlzQmNjcTEw?=
 =?utf-8?B?bnNvb2VoKzRWQmZrV0xFRC9yR1kvb3B2TGVlN0hwelBpQURqWDU4dk51RTRY?=
 =?utf-8?B?eDZiZCt2dXpyaTNxb2pSSnFlVU5LMVp6UVRXcEFDejEwdE9Lcjcxb25vTjVv?=
 =?utf-8?B?T08wSnVJU0lESlFuVWV5V1NETkJjVEVkalo2QzdoaXVJekI4RFZGOHBrQXJW?=
 =?utf-8?B?OHBEYWk5Ry8zb2RBWnlJVXdsbEpXSUpNcnlxS0tDMXpyTm9yMEVIL0hQOEFW?=
 =?utf-8?B?TzIyMHNNSHhKNFFqVGNVUG5pYkt3WHBXajZXcjhGWStPd1kzTFBrdTUxZTJo?=
 =?utf-8?B?WEd6UkdRbjQ3NEdqU2xBTkxOZXlXZDY2WU1SU21JbmRrbGEySU5aVmJrVkls?=
 =?utf-8?B?UVdyQ2tzOXAwVUlmMDNiVzVMTnhKS3dCd2NJakFJeTY0Z0daSDlNWGZkdHVH?=
 =?utf-8?B?UGtkSjBFL0xUS3VEYXlsRlFwSWVrek9nUUNNWFZDVW9HWVpTWUVSTGt1NEZX?=
 =?utf-8?B?SWJOSWpMVThRZ0d2ZXJmUHh3VlhVMVhmQXZES1g0S08vWThONUZaMnpFRU51?=
 =?utf-8?B?QmhQeTJOdEYvRjV1Zmg3UlZtNXZzclRQVlphVmE1Wjg3UHJYU3ZlbCtsNFFR?=
 =?utf-8?B?L0hkYjFteE9WN0xFNHBNZXMvcUVrbFpwYmRwamN0bVQ4WFU5SE9qWjBHSWN0?=
 =?utf-8?B?b3lqU2svblhlZ2FwbE55em9VZUhWNlFxNzNmTlN1eC9GWXZqeis0dW5ZNUN3?=
 =?utf-8?B?bVFIT2dHS29wZzVseFhneDFzY0lXeVZobFErWFlIZjF3QXFobTNuaXptVHNt?=
 =?utf-8?B?RWMwNWhiekRQODl2ekE1VTdXYVJmOEdiS0dPSDN4bUd2RWtDTWNuZGN3NHhv?=
 =?utf-8?B?NlpDbkJTNTM2WTRzT29zUXp1QkloOWtOLzByQXJFN2pubithQ3AyR3A4R3lp?=
 =?utf-8?B?NDU1b2o3akZGL1VsdkV3TmRMZk9wVVhLQTR2T0VuTG43STkxd1VMQjZJUE5E?=
 =?utf-8?B?U01RRXZZQmQ4a21UUCtnSExCNWlwU3hKZkxSeDlTc2QvdEJpWCtpUFI5eTlJ?=
 =?utf-8?Q?j62RC5FfvEKc1Za+0soAf+haBvv1lLhz6Xyik=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UW10SGJMdWErL2h5STgybitJWnczaDNpSW4zV25OVktMcGVmU01Bc1NpMDAy?=
 =?utf-8?B?TXhydWJyYU9xMHpGWSsrWW9QTHpKSGFZV1FtSEd4dW5RVy9WdHJqZk1rd1hB?=
 =?utf-8?B?ZGtqWDFPWVI3bi9GRzU0TXJHcC83WDRGdWZiUFJmMkloVzVQdDMxWXJlVjAz?=
 =?utf-8?B?SzU3MU81b1doZVFTVHhWQWlZYjJKcFVlVmV2aVNXeFRaSzI5aG9kVmRrV3ov?=
 =?utf-8?B?L3VELzZjRUNUWEpwendwR055Yi9RRTNFUDBYQnZjamxHWDFObFozdXZlMTRl?=
 =?utf-8?B?Y1FWRE40N0M1YVdWMDJsUDNQRXpQNWhaS1FWVHpqVElsU0c3RWhLUHM5L0Uw?=
 =?utf-8?B?N29wRWMrVVZqY1ZDQloxSXpCZW82UFJBd0VzWWI4eGVhSGQ5WWoyQXJpd1RV?=
 =?utf-8?B?cklVQ3dEa1JLL0hDMjd2a0RFM0ZjQU0zbUpMenJITzRITGhOa0NCVEp5b1VJ?=
 =?utf-8?B?UXdRcll3djJScExDb0hKcG5QbGUrU1RYYXJISmpaV245TU1XQWZPV3ZucGd0?=
 =?utf-8?B?MjREL21veGhyUnEzL0J2NVFXbFVLK2FOcHZpOGZ1bzVwQUVWVVJ4aWNKNFNr?=
 =?utf-8?B?ejZkRnFSSWxzSk9yWmdScEkzNDdEVG1BVTlxK3hyZVNTeXV4T3FaNThJaDFN?=
 =?utf-8?B?eW5DQTRQYmVUZHRjMkFsRE93Q3c3Vzl6YkJrd1ZGMENlbXdaeER3QUxaUlBJ?=
 =?utf-8?B?RVhSRXd2dHMrU0k3Q3R5bmxIWnhveG1oNFpDQnIrZTk4d0ErTGNMV2JSMlEw?=
 =?utf-8?B?RjdjYkdMd3Z6RUNXVzByUEtoMDJWUXJFb0hjbFlORU1oeld5c0I1YzUzTm1n?=
 =?utf-8?B?dnVBQVo2aE9CdlhuRGhPcEh3RUVHY2U1SmtHV1JKdmVwcXhqWDk4TXk2bldu?=
 =?utf-8?B?UjErZDJMaWx5WlZka29xQWl2OFRkT2RFRXNpSzVuRDhZcjlyQ2VIdVhyK0Rk?=
 =?utf-8?B?QTJpVkFnQW1ma2ZpV256Tnh2dGlBSm1VQXV3eWcvMEhOZ3YzNDVwalNXbkF2?=
 =?utf-8?B?RVNvVlVKNFpmd2w5cCtmVmtNSVFSUzhXVm1iUmFJTU9OOWE2RG0wSDhBL0p3?=
 =?utf-8?B?aU9odjh6Y2FBZVljbXFPQUM4SlZ3Zjc0cVo0RGVybjlsQVhCWXZtYXZLRHVS?=
 =?utf-8?B?bTNzc2o2bEZBQ1BBYlkzcUpPbUVRRGx0RnhBK3luL1hnTjlaYkE0QTFGVXBP?=
 =?utf-8?B?Wk1zejF5YUw3d28zUzJlU3VhMVdoVjRSZEhWRUJnWkZlckdJUVg2TTE4TVJW?=
 =?utf-8?B?Q3FDdGc1cWhRVTM1MXhqRy9KbGpSOGtkZ0JObjJXOW51cXA4VjBPTmxROXV4?=
 =?utf-8?B?emg1aVF3UmZreHNtZVFsWXBQVkxYenBycWpjMk5IOTB2dExPN3BOeXQ1UWR4?=
 =?utf-8?B?c29tL3RvdW9qY0hrUlNhSjBkVEtXM3BVaTYxdlIyWURkSFdGU3d3SVJBdlpi?=
 =?utf-8?B?OUkreThYcVZwdFpMUjRCdWdRNlk2SkNZMW1RS2xpbGZmKytmWnREbnUrRXNE?=
 =?utf-8?B?K3E2UlQ3NDN2SENjZUt1NnhTS1ZjcG1PeFkrR0gvUG13YnZlQUMrVkZaUDFS?=
 =?utf-8?B?SThJbzRLc2t2SmUzTjMrUml5blJoNWI1cHRVS1NacTNhQVJqa0hlKzVzMFRu?=
 =?utf-8?B?R0RnOFU2OFBya0JVZUF1TlJrelVXMWRKZ3pSREdGOWtYcHFnZEo3cE1GNHFv?=
 =?utf-8?B?MWhLZjZhTEtJUFNsbVEzZ2llVThMb0IrNHgxcnJBazlmL2x5U29rR0czNjR4?=
 =?utf-8?B?UERvOG4xVjBGZkhDakJYdmpubGpvTEVQR2Y2Qm9rUU1QajNSMlFyOUZBcWJr?=
 =?utf-8?B?UWVGcUZ6THBIemYxUTltN0NuaTZReVJ5TVR5dk43YnNJenZWMkFuekM3b0tX?=
 =?utf-8?B?ak5UaXYrbnNxSmdBSU9UcW1zdHBSa0pNT0YrVHV6SjBrVTJZay9QeFlQbTI1?=
 =?utf-8?B?bklrYVFoVGdudDdUWWdxWWdmZW91TURoaDByblk2TUVySGNlWno1YWZ4TW1K?=
 =?utf-8?B?RE1pdnJFcGJ0NGZrY0p6Q0NPUkhCcmVybmlVY25WMnNRMzVkTUlBWi83S1Rk?=
 =?utf-8?B?TlQ0NDFXR1lERVRtWWVqWmxsK3hCWndsQml0Q21Fc1dXVEk3RFo0VkpBd2Qz?=
 =?utf-8?B?WmFXNmZ0dzhpbG9TclllZEpQZHNyc3l6cUlTTVdoUktLMEFSd2wyL3VUQmh2?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 253a644e-4398-4ec3-2787-08ddc60688c1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 14:22:32.4880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHqO7LhQssAWTMsqOHSGpfWVWn8fNu2XhKe1gYz1wXGEzm/GyF66CBZy8vakAaiuTl9kSPEDkVxP07tY1N8bq9q5ieWZ444cTa1VblrmQHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9747
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Jul 2025 14:22:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7351

Hi Antonin,

On 7/18/25 10:22 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Document the new classes under classes/toolchain as well as
> PREFERRED_TOOLCHAIN* and TOOLCHAIN variables, which allow selecting the
> toolchain. For now there's "gcc" and "clang" as available toolchain.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst   | 43 ++++++++++++++++++++++++
>   documentation/ref-manual/variables.rst | 60 ++++++++++++++++++++++++++++++++++
>   2 files changed, 103 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 4705ca3f4..14f14b742 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3443,6 +3443,49 @@ This class is not intended to be used directly.
>   The :ref:`ref-classes-toolchain-scripts` class provides the scripts used for setting up
>   the environment for installed SDKs.
>   
> +.. _ref-classes-toolchain-clang:
> +
> +``toolchain/clang``
> +===================
> +
> +The :ref:`ref-classes-toolchain-clang` class defines commands for building
> +recipes with Clang and LLVM compiler and utilities. This class is not meant to
> +be used directly in recipes. Instead, you should specific the

s/specific/set/

Should this be set globally in a conf file (distro I assume?)? Can this 
be overridden from a recipe if requested (e.g. recipes which can only be 
built with gcc or clang?). I see you document how to do this in the 
variable glossary, do you think it makes sense to duplicate the info in 
the class as well? I typically dislike doing this but I was wondering 
while reading the diff and got the info because it's in the same patch, 
maybe users won't think of this? /me shrugs

> +:term:`PREFERRED_TOOLCHAIN_TARGET`, :term:`PREFERRED_TOOLCHAIN_NATIVE` or
> +:term:`PREFERRED_TOOLCHAIN_SDK` variables to "clang". This will make the
> +:ref:`ref-classes-base` class use the :ref:`ref-classes-toolchain-clang`
> +accordingly.
> +

No toolchain/clang-native documented here?

> +.. _ref-classes-toolchain-gcc:
> +
> +``toolchain/gcc``
> +=================
> +
> +The :ref:`ref-classes-toolchain-gcc` class defines commands for building
> +recipes with Gcc/binutils compiler and utilities. This class is not meant to
> +be used directly in recipes. Instead, you should specific the

s/specific/set/

> +:term:`PREFERRED_TOOLCHAIN_TARGET`, :term:`PREFERRED_TOOLCHAIN_NATIVE` or
> +:term:`PREFERRED_TOOLCHAIN_SDK` variables to "gcc". This will make the
> +:ref:`ref-classes-base` class use the :ref:`ref-classes-toolchain-gcc`
> +accordingly.
> +
> +.. _ref-classes-toolchain-gcc-native:
> +
> +``toolchain/gcc-native``
> +========================
> +
> +The :ref:`ref-classes-toolchain-gcc-native` class defines commands for building
> +:ref:`ref-classes-native` recipes with Gcc/binutils compiler and utilities

s/Gcc/GCC/

c.f. https://gcc.gnu.org/

> +independently of the build context.
> +
> +The :ref:`ref-classes-toolchain-gcc-native` class defines :term:`BUILD_CC`,
> +:term:`BUILD_CXX` and other such variables, which are rarely used in recipes.

Odd comma there, I would remove it.

> +Exception be made in target recipes that need to use the compiler from the build

Not native but I would have done s/in/of/ here.

> +host at some point during the build.
> +
> +This class should not be inherited directly. It is inherited by the
> +:ref:`ref-classes-base` class by default.

Only when PREFERRED_TOOLCHAIN_NATIVE or TOOLCHAIN_NATIVE is set to gcc? 
Which is the default yes, but could be changed if a recipe/conf file 
changes that value?

> +
>   .. _ref-classes-typecheck:
>   
>   ``typecheck``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index d079e4b59..2bad5cda0 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7331,6 +7331,51 @@ system and gives an overview of their function and contents.
>         ":ref:`dev-manual/new-recipe:using virtual providers`" section in the
>         Yocto Project Development Tasks Manual.
>   
> +   :term:`PREFERRED_TOOLCHAIN`
> +      The :term:`PREFERRED_TOOLCHAIN` variable selects the toolchain to use for
> +      cross-compiling recipes. This variable is not meant to be overidden

s/overidden/overridden/

Are you sure it's only for cross-compiling recipes? 
PREFERRED_TOOLCHAIN:class-native exists in 
meta/classes-global/base.bbclass and it's not for cross-compiling?

> +      globally. Instead, the values of :term:`PREFERRED_TOOLCHAIN_TARGET`,
> +      :term:`PREFERRED_TOOLCHAIN_NATIVE` and :term:`PREFERRED_TOOLCHAIN_SDK`
> +      should be overridden independently.
> +

Not sure what you wanted to convey with "independently" here?

> +      The value of this variable is the value :term:`PREFERRED_TOOLCHAIN_TARGET`.

No? It differs depending for what you're building (native, target, 
cross, crosssdk, nativesdk) from what I could read.

> +
> +   :term:`PREFERRED_TOOLCHAIN_NATIVE`
> +      This variable controls the toolchain used for compiling
> +      :ref:`ref-classes-native` recipes.
> +
> +      This variable should be set globally from a :term:`configuration file`.
> +
> +      See :term:`PREFERRED_TOOLCHAIN_TARGET` for more details on the possible
> +      values for this variable.
> +
> +   :term:`PREFERRED_TOOLCHAIN_SDK`
> +      This variable controls the toolchain used for compiling
> +      :ref:`ref-classes-nativesdk` recipes.
> +
> +      This variable should be set globally from a :term:`configuration file`.
> +
> +      See :term:`PREFERRED_TOOLCHAIN_TARGET` for more details on the possible
> +      values for this variable.
> +
> +   :term:`PREFERRED_TOOLCHAIN_TARGET`
> +      This variable controls the toolchain used for compiling recipes in the
> +      architecture of the target.
> +

Maybe add "machine" at the end of the sentence to highlight what a 
target is?

> +      There are two possible values for this variable at the moment:
> +
> +      -  :ref:`gcc <ref-classes-toolchain-gcc>` (default): the Gcc/Binutils toolchain.

s/Gcc/GCC/

> +      -  :ref:`clang <ref-classes-toolchain-clang>`: the Clang/LLVM toolchain.
> +
> +      Selecting a value for this class will make the :ref:`ref-classes-base`

S/Selecting a value for this class/:term:`PREFERRED_TOOLCHAIN_TARGET`/

> +      class inherit one of the toolchain class defined in
> +      :oe_git:`meta/classes/toolchain
> +      </openembedded-core/tree/meta/classes/toolchain>`. As a consequence, this
> +      variable should be set globally from a :term:`configuration file`.
> +

What happens for a recipe that only supports one toolchain and not the 
other? e.g. trusted-firmware-a for Rockchip RK3399 requires gcc right now.

> +      These classes define commands used for cross-compiling such as :term:`CC`,
> +      :term:`CXX`, :term:`LD` and so on.
> +
>      :term:`PREFERRED_VERSION`
>         If there are multiple versions of a recipe available, this variable
>         determines which version should be given preference. You must always
> @@ -10131,6 +10176,21 @@ system and gives an overview of their function and contents.
>         implementations, NFS does not meet this minimum requirement.
>         Consequently, :term:`TMPDIR` cannot be on NFS.
>   
> +   :term:`TOOLCHAIN`
> +      The :term:`TOOLCHAIN` variable can be used to override the toolchain used
> +      by a recipe.
> +

Aaaah, this way :) What about adding a small mention to the other 
PREFERRED_TOOLCHAIN_* variables so we know what to do if we want to 
override it for a recipe?

> +      The default value for this variable is the value of
> +      :term:`PREFERRED_TOOLCHAIN`. See the description of
> +      :term:`PREFERRED_TOOLCHAIN` to know the list of possible values for
> +      :term:`TOOLCHAIN`.
> +
> +      It is possible to override the value of this variable from a recipe if
> +      this recipe is known to support only a specific toolchain. For example,
> +      the :ref:`ref-classes-kernel-arch` class overrides this variable to "gcc",
> +      because the Linux Kernel does not support toolchains other than
> +      Gcc/Binutils for compiling.
> +

s/Gcc/GCC/

I was not convinced this was still true, but 
https://www.kernel.org/doc/html/latest/kbuild/llvm.html still says it is 
"ongoing work" so I guess it's not fully covered right now (and/or our 
classes/recipes do not support using clang for the kernel right now).

Missing a :term:`TOOLCHAIN_NATIVE` entry here (actually probably a few 
more lines below) maybe as well?

Cheers,
Quentin

