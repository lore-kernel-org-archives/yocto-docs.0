Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41155D25B79
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 13:36:23 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13308.1769607374109505517
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 05:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=E7thJdTE;
 spf=pass (domain: cherry.de, ip: 40.107.162.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cyd3ca5cKJXqebn5u/mA7qROkjPGuk+DTW0mxTGMPdVP2K5W1IT7YRZz8HQP5bOl7FBzC0MEpTw9ASXPW7E3PpKOz3xXA1e5eWXCu+XwmLMwboN9SS5sHTHmiPs3/ZwCbZSHu5VQae6ynwBtbnYtjHxpv6Q+BeDxAjptvo6bRvzaDx9Ix5Npph1Grr3DUn0sqerbTnz5D3v9FvAIoFhzdDw4oBtTEJ7P5Vjes456ThMChdNOSGk+q+Y1RYudcXQDNU85DAKfZmGBapEa8jpKoA4WVzVlDQesn+1BYx8ynhVr+ogWjxsjc2/iCKSFIlQtEUtt8g3Ug/B8ifAe60NStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmO+9x68AVTrVRl9KFn0R+TvwnyFKMRRlTL4tZb5loE=;
 b=wTlAAoj5D4Uptajf9Z+/9sQm+JcgrWGrNVQ7Q5+EnTHvO9z4nKJzbqR1fbEmV55/ZwpVflagpJ2U4dv2Le980DCpjV+l/t3RWhPQ7MkpmMPCOl6k/c9Za+a+hPFtJSvkfJI5VsRwWg4hPsLENSJiUNGWM1ZO9vYUQJc4fqPn2PzM9gdIhLzHOmIH9WhpMMJOVs79QG5EVGPKAoaEfRKpjZQWUhTQPX6spT6LEg427Z6IUxtBRxtkFnHOlGxVwTL9aRSdniFY0vMCivqrZX1FndYJo+peB9OHOUOwtzKUl7jO5FBICsVah3sYpUAn/a/Zwc8aydkJN7yMm8SrYYEy/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmO+9x68AVTrVRl9KFn0R+TvwnyFKMRRlTL4tZb5loE=;
 b=E7thJdTE/mD56deCg0y7rE5VxSwqXqWDlUhts9JOjDebR6mlGBsvNuXaDpfLTCsee5aIzNZ3YD6xwUKN42qAr+IFThxqVEIzVWVikVaiG8GlmcVxSO37913UtCS1BxQwGhVEA/1ZHDlMWwXH3ye3cNNCGDuO3VOqEE46F5G0p+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM8PR04MB7730.eurprd04.prod.outlook.com (2603:10a6:20b:242::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 13:36:10 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 13:36:09 +0000
Message-ID: <b8b080b4-30ba-4199-a64b-c652bb76a527@cherry.de>
Date: Wed, 28 Jan 2026 14:36:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 28/56] ref-manual/variables.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-28-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-28-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM8PR04MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ea39fe-3af6-49ed-812d-08de5e723256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?emhJT0N6MFRVc2JScFozTWpYenNzYUk4cXZTZVYxeW5TYXI3RXdteHZXU0l5?=
 =?utf-8?B?N01wWG5PdmVpL0ZMQ0ZKRGdEcElYMU54L1ZoVlk2SGdKa0hKTTlFdHhkWFVY?=
 =?utf-8?B?MCtKVm9pVWRIaloyOC9XOFFId0RkWVk5dDhiRzIreHlJVWtRdktkM2hGWUFE?=
 =?utf-8?B?b2hERGtaVGNUb3dJTVdPRFhHU2FSb0dQQnJMdDllWEJTajRvOHlxQTBJVGFt?=
 =?utf-8?B?ZzRuS0luYnlaQVk2dFFQYXhzYU16MUtEYXhyNlBURW04cHhpbGU0RERNcEYy?=
 =?utf-8?B?U0RFUkxoeTJwMWtWSnJETU8rYzBWMUwzUW5ncWVkd1FvNTlYazVTc3RUMEpz?=
 =?utf-8?B?N3hkTlI1V2wrSkphckt1SFJSRGR6QlR2TmMwQVg4UHFHblBsa0pUZFpZeGcw?=
 =?utf-8?B?R2NQRWhPQyt6MDRGUjZkc3N0clN3WmY5SVFTWUlNa1BmK25iODdhUGdaeXZw?=
 =?utf-8?B?UG8xbytxUjNoS3V1R3JIeDAxQk4zdXFmSDBFRVgwOFNaK0JUWnZvOGJKWFRP?=
 =?utf-8?B?bnB0R29pUDlqZjdEb2xFcUwyZ0VoVUp4NHlNRmlqdEh5ZzNOTnltR3RPN1ow?=
 =?utf-8?B?bW5CL2tCNEtqdytuUWdjbU9CeGV3ODh4U2dBdnA4Z3lSRjRpdE1EekNvZmNZ?=
 =?utf-8?B?UTdPa3g3eC9Tb3B2eTRYQmtDZGx5MnhnOUNWVFBleEtNbVhZZ3BLSXlRSzBy?=
 =?utf-8?B?STZFYkJGSzRNd0VTNFJwRVk2bHNRTk5oakhINWM0SFpqcEhCaEt2TzFkWE5H?=
 =?utf-8?B?TUMyS3VVRFlJNUlFem5YVWlPWG9ZOTVOOU1MMVVDT1VWcnlRR2RZZnRkbTA3?=
 =?utf-8?B?Qm5PSEZmYTFDZTNqVi9xN3BqNHZOU2o4Wm1GYUR3WnRBeXBPN0E2SVIwY1Jy?=
 =?utf-8?B?MCt1c3ltczNBK3ZFRGlUZlFreEhNUG9WMTI0bHYwMnJhRjdjQms5czhsYmNj?=
 =?utf-8?B?ZG10blFleEl3WnFlcWg2UVlCZzZRS1huSStEa2hrS0dXM1JvQWUwSGd5MUNC?=
 =?utf-8?B?eFhXZ3Y5NGU4d2JIcFM3MURpY0hRS1g1VmtrMms3V1kxN0FmdEVGRGtCQ2Ez?=
 =?utf-8?B?dXJ5Tk5UcUlxL0huUEpFbWVHbVdBSnRLQlVSQ096SUx2anZSOXRINkV5cjl5?=
 =?utf-8?B?Ulk0VTVjRUNCUkVlV3MzQUNmNTZxTXNGWkR4OEZvOE5Tblk5WkovWlNaRVN3?=
 =?utf-8?B?bUlzMjhXczdYdUNSbXl6WXJaZ08rZ2NwREZEVGozekF6QkdUSStoUHNJcVZO?=
 =?utf-8?B?OFVEL3JrZVBOdUFFYzVBNkZnOWxZOSs0dzFpMzg0dXNQL0t1bGhWS3FiN1Uy?=
 =?utf-8?B?N3E5a0V1YTU3ZTVvZmlqdjZVMnpsWGhETlZraWFTUnVwemZ0OTFZK0NaRExJ?=
 =?utf-8?B?MElaekNHd0NuVlp5S3pGaTRENUNyeDBuOFNWZTVHVjlIL0RZV2RiVElQTDJa?=
 =?utf-8?B?T3RhY1NjV2hZZ0Q3aFVwbTk2ejdEVWxPT3VCSzZPOGlzdXBBSUJMUjhTR3dL?=
 =?utf-8?B?cG5nMWNSbG5JSkRCdFVBeTczUGwxcGdpWjRCc0ZiTW1ldEZJSGZad2xzWFBw?=
 =?utf-8?B?L3FWZDVnLzFkVHJ2b0dLeHJ4Rk83bDN4a01rQzhTN1UrbEFGV3Jzc05ZV0M0?=
 =?utf-8?B?dGQxTnBySThMTkpsNmFQNWw3dWlaRktBZWtVN3MwNmZlY3B0M3pEeGxtdmtC?=
 =?utf-8?B?SS96b1BGNE9PK0hObW9paHl3UUQ4bmZmVUtCOEZxRWgvZ1NaaWdjWUMrVDh1?=
 =?utf-8?B?U1c2bU9vVEVRYXoxSkVUSVN6VUY4d29QcVdlMU9VU3R0UldmTWVIeG9pQnNt?=
 =?utf-8?B?T2x5SUIxdFdMOHJKWkc0Vldjd1pWbGFYLzNwZ2gwb054cVl4VVhHYXBKbU9N?=
 =?utf-8?B?RUdDaUV0YTdmN3QzRDdEK29PWW9yWUlwQzQ2L1EwUHpIb2pacnZsTHduU1gz?=
 =?utf-8?B?TXhoQXA3cXhmVHNPc0VlUUJVSGNmOG9nbDI4ODVEL3dZNUh2aXVwN3U5QlJm?=
 =?utf-8?B?V005eFg5d2l4K3hNS1pUbjh4VmxJNkFlcmF0YUhHTHB6VkxDWHNGbElvRDJm?=
 =?utf-8?B?cDA5ME9pMWpveHdJNmN2R08xR0twWXZjb3Nrd1VGcU9lQWRuRlp2ZHg3Snd6?=
 =?utf-8?Q?OF/c=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2JBWmI3NFVGTERJMnBFbmM1UmdEUmhlTUV5cTdWTFdQTWRWTjNCWm1EdVdD?=
 =?utf-8?B?Qi80UjhqWERlRllCNlhNZm9IaGJuTnRYRk9ST3d6blA0bjYyb2F6MTVTeTBj?=
 =?utf-8?B?SWd6cUhiNE1BcGhkanVXTUtFejZnR200em1LZkxvaC9Dd0R1dHhlVWR4SGJy?=
 =?utf-8?B?SkNDcVVvcEtxSXNaU2hPOW1aNi96ZGxISkpDZWwwMlNjYnNKMnhlRnVZOEdE?=
 =?utf-8?B?RWgvTitGenVNUVRhQllpV2o3YjNrRW13WVZBcjdHLzc5Zm5xNStmalp2Y2Z4?=
 =?utf-8?B?VlZkSm1BQzFPcG9JSGZHYXY2d3FXV2NaOTFMYWZSNG5zcnhoSEpweHUzR1NO?=
 =?utf-8?B?THFMN25saThNZDZBNGE1NHpQSGJXNFZPeXJoUGZ2RlNFaEdialJQZEhCRGRh?=
 =?utf-8?B?MWdIZWw4Uk1uUE9ic0dQL3NCenpTMitCczlnZU9ISUlQaDc0TWlPWFQwdlRW?=
 =?utf-8?B?UjA1QWRLVldKYWE4NXFqOVZFWTNwM3pJalFlVEcwQytydDRXM05ub2tuWXRw?=
 =?utf-8?B?WWpDQzdDcHJoNjBid0JHNXprMFNmQ1U5Zis4aU9Ca0VEb1lqQVhmTjE0K3hv?=
 =?utf-8?B?ZDdEZU9WTjFncWo0RU1NcnRhamlYajBJQTQwYkRjL2RYWTJ1TnozclJTSEkx?=
 =?utf-8?B?VHlWTVlPM2Mxa2k1a0orbEd6OHJxSzdnbjhxUTdKMU1pM29vSlhYcHkyRWRX?=
 =?utf-8?B?bEsvdGQ5Sm5peE9EM0ZZdlNCcEpUeDB0ak5OWk1oM0U5VkhXM2U0TTlBZlJZ?=
 =?utf-8?B?S1dNbGxpT1JnUyt2ajA5dURJVXI2djJZMUNrNytPOEFZS1NIRmpmWDl1QThG?=
 =?utf-8?B?WUxxZCtuZFpiWDd5eDNlTHQzZHZISSt2QmdxbkdOQm15MFpQQTU0SjA4ZGVq?=
 =?utf-8?B?ejFvbmNJZm9wbEF4c1laUDQrdGp1cVFNVFU5b3hwZXl2bFZzbmM5Nk9uaXJw?=
 =?utf-8?B?aUovelc1UFVDL0xmMUFodVY0bjR5bjJYVkxYL3hVN0JpM0E0eEZ5RmdsZkFY?=
 =?utf-8?B?QUEwYjl5WmJRV1JSZGFsOFVrU2pKTWQ3dVFQVTNyOHYxaEtQaUFmOCtWcE1D?=
 =?utf-8?B?Q3RyQjZzN1Fzako2SHdyRmg2Z3phWS9vN3B4M2pXRjBjVmJlOXhJNGMra01R?=
 =?utf-8?B?UWNpdXFpT2JETUVQUmxjTVErNzJiQzRuUzhFdWxBWmV4K0UyYUZwNmx3SVVq?=
 =?utf-8?B?eU4xellsV094bTdkZk5QT1dqeTZ5bUpvN0pXdENuV1VwUmM3Sk80RXBWOWZr?=
 =?utf-8?B?ZTVxMlo0Sk84QlNOUlVaV3h0S040T1p4eG1Nb1FDbEM1UldRQ1pHRFV6VGQ1?=
 =?utf-8?B?WXJuNkx0MzBnTkd4UFNGcHR2ODBWTW1wMy9VWXR0WW1JUHJVaUFlZmV3WlJS?=
 =?utf-8?B?MnpzR2RJZkdxbWNyRWwvSG1vRVNQVlhsWlFOTWdJbDlVdytzQUlTVDlENDEr?=
 =?utf-8?B?QnRsR0xQa1lXRzNnK1lTWmZHUnVXbkpGdDlzVkJVR21HcTJBQ3VOSDV4Z0tp?=
 =?utf-8?B?UzJobktLNlBDL1lTRHRmSzJWZjNVMm5EeFh6YkYzTFpNcjV2eWdwWHRvUjUz?=
 =?utf-8?B?a3JSOHorazh4QTNCWnNmOURyaWtjbk5uVDFVaUg0VHBtREdSVjM3ZEhUeC9L?=
 =?utf-8?B?cFRCbW9wNzdqM25KWkNNS1h2U2NqN2c3WTdvRTVtTjl6d3hoSkd0NUhCTEkv?=
 =?utf-8?B?UStMc1NQbXFwRFVJd3dVd0JENEtYeFgrT0ZEN2JtL05RQURKUnFCWWlEUWN5?=
 =?utf-8?B?NjNTK0xRUVBMMTZnY29xU011UUkwSTlBMG5YWHcwRzlSZ280YkdIQzMySU5m?=
 =?utf-8?B?WkFkNGt2VkhvZm0xVU1aejQ4VnBuNFZaMCtWSDJYOVJnbllEYmNOeWl6d04w?=
 =?utf-8?B?V1MrR0o0a1d3b21DTW42RFF4YkxEbzFFK0ROblIvNmZ2emlnMUZCTDhzczJC?=
 =?utf-8?B?Y0c4TjhxOE1ObDVSbDJXMzV0TW4rSFpZNCtSU1lPS3g5RVBHckJGWWRrU1lE?=
 =?utf-8?B?VmdWcUx6T0sxbDcybVVJVExqZUUyUTBKenRiOUdhVXh5TGtiR080ZTJYUnpz?=
 =?utf-8?B?S1Q4WGxNWTRraVJaZEorR2x1bzF0ak9oWkpnRk52eWJhWGNrc2VnTzI4MmxU?=
 =?utf-8?B?TkMrVmU2TTZSaXdrZ3FHcXI3WWNLSG1RYW5pR0NablBnVCtvWlE3dWc5V3Nu?=
 =?utf-8?B?eUVBQ1ErUEcwR21yc2JLMmRDclE5dkZadlhMd2NxT3B5WUdCS0JzTk9PZTUx?=
 =?utf-8?B?cy9vZWxCYWU4TTFOTlZETEpKaG8wcC92c3pVSkx6R203L05UUE5tM2s2T1hh?=
 =?utf-8?B?M2FnRVlydFZxdDM0MXBhQk9sQkxPNlhTVC9RbTlEWmV2NVJLMHRBZnVZYUNj?=
 =?utf-8?Q?M4V5IyoYOn8STZr7pfm8AXnO3c95nCN6evZqz?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ea39fe-3af6-49ed-812d-08de5e723256
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:36:09.8576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmhDziOxb41UPBhyFKlCYsdZ1hv13InINrDwpwl9jw4uq3FWxwFkZ0YtCToJhq9ulzm0r22Scuxlzfy7YwDft/5qn3G+RZFFPTQ3sY1a5Pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7730
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 13:36:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8759

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core
> in most cases.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

