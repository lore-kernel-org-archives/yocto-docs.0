Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF33D74EE2
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 15:14:49 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.329.1769181280020321126
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 07:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DaYEblbS;
 spf=pass (domain: cherry.de, ip: 40.107.162.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdEyOsyTKjRZWBrrEATRoa22nFtUSWEi7MONNKnT5LdJ89dEwlZ0qu7DoHB0+dhpXdS+tU6IymFwqJPVP5xynsG00gx4LdN8ofYzU+ebuLD+Kkf/qQs2BTKb7CmKkCHGLkTnxfiNSIc2CHhB6xf/Pb80Thp4c/Zf9eRLoAwGZj/0cttn3/GC22EMwCf0stOl+6h/8xbQmI78KqdYlba/jS+Q9J6fooHzhvFurJJ7KdWqe38GrHyE5tHIZvS0nbyQiTRAlmGQVKmdHdq62K+223S31TTrwSpzBqjF6skrIyGanwWO+k8t56Kfola+WQiDYX+3JkXbwnAH2PnhGsPI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFACCu/TH3Jmwb28HY+XrqYbh3b5s+lwb7hommpYn4s=;
 b=Edx01EjEKV5iZlkt3xGw4pfm4g0LrpgF3Qn1AMBM3vEZHE9LaVWllUK7pBlnCASeLlaR4KEokp30pi7JaZs1urIwOSkC2q6n9++BpZT63MvhEfWSi50zsjNutvmqwD6/HKqj4MB+CwlD+PAxKLzTcUa2jR8zp4Un5jSqQKycfaG+2NBss16elbqIt2loIYeVmui772eAfF9uVzb9lUPDskulfdPIKqHXJ3u/mz6FfvKTHnkev5gwNrzHNo1TE74+rfGDXS1ra2Qa4oe5IQ1sysYmlNw070ARpmxjUhchB3Dt5xCWCP3p+8Zd/CNYUevLQKKUQbcc3isRsqxzqKXbsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFACCu/TH3Jmwb28HY+XrqYbh3b5s+lwb7hommpYn4s=;
 b=DaYEblbS1aK/SW9Tjt8LpA6ZFEcwPBVFJi/Fa7PtZpb+YR9Tlfct/GEV2aBIX17NIrU06lE+Ezx98BRX/9RtZkn9XkwpL8zImWtwGVBVW0To2I6mEgcWW4FbIXLDfIrfbAWHYuYyqY366EP9gJuaJkPNetmMu53Oj7j1JqClGLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:14:33 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 15:14:32 +0000
Message-ID: <b782e622-391d-43fb-99e2-9431091ed409@cherry.de>
Date: Fri, 23 Jan 2026 16:14:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 1/5] ref-manual/terms.rst: refresh the Build
 Directory definition
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260123-terms-refresh-v3-0-41c35f0a6a13@bootlin.com>
 <20260123-terms-refresh-v3-1-41c35f0a6a13@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260123-terms-refresh-v3-1-41c35f0a6a13@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JN3P275CA0133.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:d0::15)
 To GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f1792d-29b8-4e45-f850-08de5a921c85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VVZDWFJYcDJVdEZ2Z1huMXM2ODB5RGJzT1M1UndKREJiQUtGaTRSZGltWkRu?=
 =?utf-8?B?VE9ESGpmNmZVNVJPL0dFTlQ0d2lyQ2hKeWVFNlJLZ0tud3QwSlJHdktjQW9a?=
 =?utf-8?B?V3pSODBvR0k2bjNmLzhVeitZNHc1blBkekhTd1pCZTZqYnZKM0xaTHh6bjhy?=
 =?utf-8?B?M3RFRGRtbVlEVGNnUnlTdzAzOGplTUZ0eWVkWTV1dUsyNEZ0VEN4WFpGbzdy?=
 =?utf-8?B?MVNTSVFYZlkwa1h6eUpCWTMvSThWZDd3WDVVMUZUZS81dWlhUnk1N09jOW5w?=
 =?utf-8?B?YjU4aXRwZGxMVGEyLy9QRTRpOW9Od0FZKzl6NWJPKytwR1BrUHl4Yjl1dkVP?=
 =?utf-8?B?SFNXMWxEYXNKTDdVNnZqc0VNeUtwOWF0T2ZpczJVdUhHRkVlSngzOFUyZHRj?=
 =?utf-8?B?VFFCd1dHZitDdWVDOVVZRFVvdFgwampGOVR5QnBqcllOOWYrZ0Rkd1dXMXQy?=
 =?utf-8?B?OWZRd1NLMzh4c1Awb3lvNGtXZmprOXp3TkU0NlFYYitIWjV2VS9lQVp5L1V0?=
 =?utf-8?B?elNKd3RpUXZFaHIwMWNQaEo3bFNEMTlQQi82cCs4ajYwTDd4YVhqKzFKVXFN?=
 =?utf-8?B?QUpyUFovT2lQa29USTA2MzVhNG5MMlEwdlBCbDFGc3ZKK0t4bjlMYTVJNm5t?=
 =?utf-8?B?cmlndG9qSUJ1K1B2Qko1Y3ZzYndkWHFHMXdpZnBLUk9peEtrSmlvMTRLR01z?=
 =?utf-8?B?eUxabnlLeWUyVTNvelVYRUI4T3NUQjFQMWowbkpsY0dlYnVIcSt1cjFkYWVv?=
 =?utf-8?B?bEFYK2MyZ3BxRUxrdmtpM0hOUEV1elNkaUx1R21zdCtRUWZFNWZXSmFONGgw?=
 =?utf-8?B?UmNXTTVqbjQxYmJYNXRHMHRQWWY5cElMejZCejh2ZWM4bysxWGRuUFJlMkE1?=
 =?utf-8?B?RHpzeVEzVEx0bHMwQmJJVUF1YVBPc3FLMVNyeFF0WU1xSmdabFlFbUx0TitG?=
 =?utf-8?B?Z01iYUNNU1I5V1d3TURPYWhwQ2ZoNW03YUNud0hWUkJMZE5NVDRRK0JlbVds?=
 =?utf-8?B?WEhob3JEd0RkWVovMUlhdGwzeWNBNnNnNU0zWFlpNkJNandRY0FuYjlKQmg5?=
 =?utf-8?B?TEdJc21WMWxzQVdzVGxyWHNjY3lYL3VCVVlpUXFUYmVGZmRiNThhTVI5VW9q?=
 =?utf-8?B?b3Ird0hVK1ErTUdlMDRmdGJDamxEc1h1QTlBcVgzeVFWK2VZMlBFSXNya3Vo?=
 =?utf-8?B?Vk9TalNkVUVFYUt3dllwQ0ZJMnloNGEvK1I4Q3RoVmZ6d1pHaTdWZ3RtK3h2?=
 =?utf-8?B?ZmYrdlNONm02QjVIV2xFbWRGditmWGUrTHBoMjVWSG1HL0x0LzZ6NUoycE12?=
 =?utf-8?B?OVFxcUI2b01SMWlWcFNNTERmd3YraDFsTk85NjdqYUMzZXJtSEl2NEYyUmhp?=
 =?utf-8?B?ZFpTQUpTRTFscmhTNDJRSDEyMkp1K2o1OGtwQThoOTJWUWMyS0FEQWNsYWZv?=
 =?utf-8?B?ZklUT1FseUVST2M5V3F3MS9YcE1UNHo3ZDJYUGlZdTVKYUU3dkpRM29lTkhi?=
 =?utf-8?B?ZFVzMEh2c3lWTUltMlQrWmR6cGZtTnNmY2djOWtxaHFPRGRBQjZxS2Z2NXRo?=
 =?utf-8?B?Rm91eCtJdmdzVWZ4dWJwblVOdG5nMGQ3eUJSODQyRE0vMFVRUHAzM25XY3lU?=
 =?utf-8?B?ZTR4NzA0MUc1bFJzbzlaeE9wYVNJMmNaU0NzNlovOUFsSm1TZWhnbHJqTWZs?=
 =?utf-8?B?a05FaVBYSGFvM2FHMXRHdlVwS25UZnJjL3FNYktmRWNNd0c2Q1pNa2xJdkNZ?=
 =?utf-8?B?TVlTejY5cldWTlppaU1qQ0luYVdJRnJJRmltY05la0RoY3hVR2JoYXhhOVRS?=
 =?utf-8?B?L1hwK29lTkxPU1U0VnQvdkVZMitqd3hGN1RRc01Bd0FsMVBTcmk4WndnTFNZ?=
 =?utf-8?B?akJQV0NmNXJ0c0dsT0w5N0xoK2JSVEw2Q3Jkd0RWL29JOEY3QzFCVC92d0o1?=
 =?utf-8?B?RUlpcjZHYjU2cEFHMGVCTEpyVUNoSDZWaWp5SWdkbGFzWEY5SkV2Vkw5alRH?=
 =?utf-8?B?VW8wc2pYZG9yejdMSkRuS1BjdEdPRCtSR1R4bWhtMWdqdjVsdUxZRGorU0t4?=
 =?utf-8?B?bkd5b3VKVmhmN0twZmQ3TE1OckZlQ0YxeXdsSUJ2WTZzazlGTkkvL0pobzVa?=
 =?utf-8?Q?YB7g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Sm5RcVUvREFyazlVZXVNK0tMdGFQKzRwRzZELy9jUWxVRm9GNFl1UjlMbUFB?=
 =?utf-8?B?dzlJbmRLcUtqRXVLSlI1cVFzaEZDaW9lT0czNDVYTWtRemRZU3Y3eFZ6NFNz?=
 =?utf-8?B?V013Y1lsYlJHY010Lyt0SEJUbHZNWFI1b3hheG5hUE9MQ1dIdGJlbmFVS05H?=
 =?utf-8?B?RlhURno5MXJpYWxiK3NkUVp0YWFoZGRXWWF0TGNsUG8xSE1NcDQ0bkJ1UDAr?=
 =?utf-8?B?a3JXN09Ka2RBdEtheUpxWXBRZVJYTEZUNEZCUVVnRDNYWkQxbUw5cjVRVWlX?=
 =?utf-8?B?VXgwT3lqTU1Cc1NJTW5lZ2gwNkxDUVd0eDlZQVo5SjYrd25RdXJWUUtFUGZq?=
 =?utf-8?B?N3FlME5YdTZVbzNyTExrMDRwVzRmVmFQakhDT2JoSC96SUJFMWpoLzBVWkRP?=
 =?utf-8?B?b2xpSnYvRFhtbm10RzYwN3VUcStwZFY2dFhPbDRDTjVDTDlzczdmNEZvNTFW?=
 =?utf-8?B?dEpLeHRVcjhFMzI3N1kyL1BVQjZ1OTVwUkpZUytWM3pXS2xJQUU5M2xpNUJX?=
 =?utf-8?B?MndhOXRrc2VOK1A3OUpHejVNTWhTemgra3NYeDBrTm1qWVYvcWhtRnliNWx6?=
 =?utf-8?B?MjJ4SlMxdmV3YldVMDlxaWtSeDJkblFXMDF6cGhXeFJnL2xPRjNDS2w5aVUv?=
 =?utf-8?B?a1RrbklQaXZMekNzRXFKa2QyZnlFY0ZUS2dGMVQrOEd6V1h4ZitPWGNQS0tl?=
 =?utf-8?B?WnowRlFPUnJocnBXeHJIazVIa0pHQlhiOHhwNEFRcHBpNUQ5WlhuS0FmRHYx?=
 =?utf-8?B?NFQrQlpMVjAvdzdYd0VaK0htRDloUFFRTWdRWS8vVnJNZERVK1hla2V1MHN6?=
 =?utf-8?B?SW53akdVQ1crQlhuaXEzalpkbW1URCtwU0R5K0hvc3JxcnI3VXljVThKL3B3?=
 =?utf-8?B?NVFLcXJ2VUlLM3RaS3VNM2QyYjRidDBpemV1K3VPUW9NTUxSOHlqdmJtUlBK?=
 =?utf-8?B?dHMxR1ZwTHJjeGlwVys5UERDaU8yK3MyWXpNb1QxSzcrSER1dE9RVmtXU3hV?=
 =?utf-8?B?NUZ6THR5eEY3QWRSRGFiZGFJVmU2Yjdzd2dEUzY3aEJiV3dHV1JKbHJrNThu?=
 =?utf-8?B?NDRKTUduRkp5bytWTHN6QUNYUk0vV3NKMXM3aGpNVGZkL2NUak42bmpkUkli?=
 =?utf-8?B?U0Q3SzEzSlE0b003WUR3Z3RwQ28wTjlHSElrRi9ocW1MLzNZeXJSVjlCUFp4?=
 =?utf-8?B?M3FnQkdNU0Uza25FTjg3NEV3V0U4K1o5TndzMWx0a2gyN0U1TmZtL1U1TWdX?=
 =?utf-8?B?SmJOWTBPQzdFWUk2bzgrL05YWTlnYlI0dTM0bGNiV2hiNGRYTlpjSndFUEpw?=
 =?utf-8?B?aktsY3dTOVJYRHdhTWxBL05hb1NldEo3Z0hjNktqZno5RjN6UTFHUGl1c3ZN?=
 =?utf-8?B?VFdHWHV2S2RpVGdqVDY4MnROcXIxaks0bERSN1hvekQwVlo3RE8va0o1U1hB?=
 =?utf-8?B?UDBTN0RVNDRZR3V3TVRCKzNic2R6YnhZUmpFVFVENENPRFRsbzJRYUZXV0d6?=
 =?utf-8?B?S3JVOUpLaDljZDBCRGNSOGhnMW9INU5VZnpwdEg1VCtlUjBEZXF6VXlBN3I0?=
 =?utf-8?B?V04xTk9JVWVKYk0wYVJ5U0swWCtMZ3hiSWthaXBpNXZmTHA4S0RaUlNOVG5s?=
 =?utf-8?B?Z2dZUWhXZWg3cGt6eWVYdHZNS05nWmRaUlhLTnZqdVhLejBBMG5CakdQdHVV?=
 =?utf-8?B?L2tMMjNRbkx3akNIMWZKV08xcnE3QWZNNHUwYzgyQllwUjRGdUlxSFJibCs4?=
 =?utf-8?B?VmJMN2xTYkNlZWk2L0hCTFJjMFpLdFNXT1BhSlVhazRKUGROdWZOWDl4Nm5I?=
 =?utf-8?B?YVRaeWY3aXZxYXU3ZERGMFFjWVhFbGU4cTRLenZIUklhNXZwTmtnL0JnSFYx?=
 =?utf-8?B?Ukc3M3lWRTJ2OWhUcFNMOFVjRXF1cDk3MFZpbTA1WktweUhISFZadnNFWUdP?=
 =?utf-8?B?N3pYZlBZQWZQRDgxckxpdVVWeVB0elN2bDE3b2RPUTBaUXk1Y3M0OFdjUVJJ?=
 =?utf-8?B?d2xRL25sZHA4QmY5SmtCWWltMm5UTG13Q0NEcDdsQStQZEJ1WUtFS3RQZjNI?=
 =?utf-8?B?Y3JwNll6VWNST3R5T2FBTnQwbVZLS0JHMjVnVUdMZ1FmMU1tdUFCV0hoRUxn?=
 =?utf-8?B?OFhWSnh4YUprb3hwZC9sS1U2T0xOQVpYQkNnVjBGU1Z1VXE3enB2aXpWZ1V0?=
 =?utf-8?B?MEZjZkpVTzBjQTJhcGpRYlY3a3JsUFlUb3NZR0xWcUhBd0Ntb2RGSFNuMk5N?=
 =?utf-8?B?SHZRWEhYeDFaMitZUUo3cGx5aXp5MDEwK3htUEs1RUtsTU0zNVB3YUZxMkhk?=
 =?utf-8?B?MFUrKzRnWXJ3Q1FTK1k0ZTdtYlZuMWUyalFhOHVrUTVVL2F5SHpROGlZT2xZ?=
 =?utf-8?Q?VsBWNtYcssbOO3wctP6q6BSfX1ulfrPc7fFmP?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f1792d-29b8-4e45-f850-08de5a921c85
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:14:32.6215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqIEIcMVZp5J9F9xI0UD+tl94VYT8WpKH/qFtU75JRhl05VCpOuuisFlbLhnsQTCJYPLDTEuEqIkKy31a6N6DSHUntXeEcesQ/Ry4pWEywo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 15:14:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8646

Hi Antonin,

On 1/23/26 3:58 PM, Antonin Godard via lists.yoctoproject.org wrote:
> After the Poky repository obsolescence, refresh the build directory
> definition. Fix the formatting and indenting issues while at it.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/terms.rst | 46 +++++++++++++++++++++-----------------
>   1 file changed, 25 insertions(+), 21 deletions(-)
> 
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
> index 6a9f88061..fe68b41af 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -63,36 +63,39 @@ universal, the list includes them just in case:
>         This term refers to the area used by the OpenEmbedded build system for
>         builds. The area is created when you ``source`` the setup environment
>         script that is found in the Source Directory
> -      (i.e. :ref:`ref-manual/structure:``oe-init-build-env```). The
> +      (i.e. :ref:`ref-manual/structure:``oe-init-build-env```, or
> +      ``init-build-env`` when using :doc:`bitbake-setup
> +      <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`). The
>         :term:`TOPDIR` variable points to the :term:`Build Directory`.
>   
> -      You have a lot of flexibility when creating the :term:`Build Directory`.
> +      When setting up the build manually (see :doc:`/dev-manual/poky-manual-setup`),
> +      you have a lot of flexibility when creating the :term:`Build Directory`.
>         Here are some examples that show how to create the directory.  The
> -      examples assume your :term:`Source Directory` is named ``poky``:
> +      examples assume your :term:`Source Directory` is named ``bitbake-builds``:
>   
> -         -  Create the :term:`Build Directory` inside your Source Directory and let
> -            the name of the :term:`Build Directory` default to ``build``:
> +      -  Create the :term:`Build Directory` inside your Source Directory and let
> +         the name of the :term:`Build Directory` default to ``build``:
>   
> -            .. code-block:: shell
> +         .. code-block:: console
>   
> -               $ cd poky
> -               $ source oe-init-build-env
> +            $ cd bitbake-builds
> +            $ source layers/openembedded-core/oe-init-build-env
>   
> -         -  Create the :term:`Build Directory` inside your home directory and
> -            specifically name it ``test-builds``:
> +      -  Or provide a path to the :term:`Build Directory` when sourcing
> +         ``oe-init-build-env``. Any intermediate folders in the pathname must
> +         exist. This next example creates a :term:`Build Directory` named
> +         ``YP-&DISTRO;`` within the existing directory ``mybuilds``:
>   
> -            .. code-block:: shell
> +         .. code-block:: shell

You used to have .. code-block:: console in v2 according to b4 diff, 
that was the right move (and would be consistent with the code-block 
before and after that one).

Either fix up when merging or send a follow-up patch?

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Cheers,
Quentin

