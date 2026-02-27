Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8C1FD9E2C
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 12:08:01 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.94228.1772194077955142883
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 04:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=CHmzV1xo;
 spf=pass (domain: cherry.de, ip: 52.101.84.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDL06njOOlq1apoBibTf6wnT62QDcaFPr6iyfxUDArcpcgqjBBco87ExeBFvOMzwHzj4P6CejsiXqR8dGKCIUM9ywL1Ao7pXuWict585s4V886kA03+iUfnNbPj0TpODd8c53dRSIhq9qAYKk2Mz9lFy/OidnTs3Q/sPhrPXBn4oco42x4LVzk67iSaIJFCoV5e3eEeiQnD0QhHYyZ8PHpjlLRqFtrws+Z2DoIE9Yh71i5a1EzVH4BICgnAHJRSk+zCJrH5q6ZXjJlZiCRVMtACAbVTLxjca1iIsN02TOp/o527nZ84Gls7JZuWjM/ObfoVDwOj5/7PyfW1Oi7Easw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy6TtCkmA0SfHyUtRg4/oD1eByV+y3rfSLJypF5ZeDQ=;
 b=G5fI1PiqsnP6rtzGmqtsNJT/zYwl00PXcYKdR4HU2UIxfYR2/MAdW7jj8IJT83AzQA4hobnAEWL65BreDfARxr7qMizsQktecZI/Xluyf6JWu1YMopda7+8Zo1gXoUQZc1N3+Z5kImcLHEhjGgIv0Dat0Pl0UyfPi5xRQYpKGnA7WQJ+BWur/eeLnIvzm9TCYJzhzXspsLI1KWSoMoOLfiPNwzktB4A+5Vizhk8VC/PuoEXpfRVluXM2UB1g5ZEDN0JjHHc3aox83aRamvTeBY2G3bXFXY7UAOkhtNySc/zDtnbrjIrrZbiwNTaZpt0fyabseZ5DeOw/HBIDh02Htw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xy6TtCkmA0SfHyUtRg4/oD1eByV+y3rfSLJypF5ZeDQ=;
 b=CHmzV1xoAUi5jbUWQdzbdBJ872XfR69zKaIisQS+cBQYYl7zDrRqq0WsHXYqAfXTqq+1ofUVBsa9oHTr40qb6GzdmmMFiJiJ4c9T6PrnXek34ek+X2evb+JaDOqbUMjoGIGu6GC848cEkQGn0gQ1k4iBu4qAGvDoEaQZAZNzOzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB8054.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:07:54 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%5]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 12:07:54 +0000
Message-ID: <c9b2cc67-4b68-465b-9ba5-fd4cbf0332df@cherry.de>
Date: Fri, 27 Feb 2026 13:07:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] qemu.rst: parsing of the code-block was not done
To: jan.vermaete@gmail.com, docs@lists.yoctoproject.org
References: <20260226180845.6135-1-jan.vermaete@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260226180845.6135-1-jan.vermaete@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0099.eurprd04.prod.outlook.com
 (2603:10a6:803:64::34) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dad7526-210b-47cb-b413-08de75f8d670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	XL0MbswsOIyrJwUWUtPWn1r0mc7J9uQgu81g+HyfKWW+ZH8N5fgaPfpuxvEGdAkNJIWsAlMeTGTOSejkmBmHAyAoWx5sviI8u5DZEWRT079QuGdiBJTLwcbxN/6xRm8dtANqqYcxS3ebTuquUdfuwMTSpxPZkYMPXbkQP4OGei4iLnmbqealFBcmZJU8zOz+/PgIGMs8UVnc9in1lu4shYf4oAkKTaL0Cw1j8nLkbAt76XWUOHjdf1NDJyhOhFt5EApEtlkueFzrifza9R+GQA/Yax1b165isa/HN7tTt9ocqhqhrCPX96PRY4Apss4cd242/ssIinQLr+kjcVgtbUaVhJSLqsYUHzdNukt43j3ACeMumHRInjh2WzxUvVvGZ6UiItfwuX6jX26fpJQhsZsvEInjNnWGiBtSGqp0qBcaqOruMHaLkEMIGu7s8CkayMe78CX8cXVv0RYlXZsVBcBameiRkHBacHu5V3giCJkfsWDriiTFudcwDvg14eoDgvA82DX9xvjaK2po+YI4lrpC5Etj+VjPgzG6scXgRFqyql7VNHASNhSTk98X3JomI04yfHmx55lOfsx2kmJ11KO6zusXjuYAU46/0jkXoWsSy46cL8Noey/Wftc74mXrhDWpPKfmTGnBFdwbfCvxRZJIhuxT/2Hztc3Xi9Akntxt6H/lKCZiyZaik9v618YwUQwtRaPDkCWyvctq4SEYZP6J66vr/dLLFMD9QurAQC8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YjFKM1lPNy9nU2EzSm5wa29ENkt4RlRwYUl2cEFVQ2NINkdZczlvSXZXbFR3?=
 =?utf-8?B?ZXZqWS8zL056Q0lBdnI3NEozZ240QTFIRTN1Z1hjeW9GU3dCTGtGN2x6Nms1?=
 =?utf-8?B?SWdYcCtkYXVuZ25tWmk4VjFSNzhJZGhFL0RHaGlwM0MrZm9xVUx0TktSTTVx?=
 =?utf-8?B?Szd0c2Z2bHZ6Q2t5bkNUb3lOUTBzZExKSkdXWVpaYzl0RE5BWlkxMlBPdUlV?=
 =?utf-8?B?YmxUVzBuZ0xBeS9OY3BaQkl6UVRYRzJCZU80eTNlY0xaeVR5WmFvTExJMFJW?=
 =?utf-8?B?K05BWmU5NFJPWkxScnBWNmlzUE40ZU9OM0tRSzNHSFJCYWEzOGtzNTJ1Y0JS?=
 =?utf-8?B?aTFDOURiRVZRMElNZU9jQS9HQld4bzFSSGlEMjR2R1VLUG56ZlN6Z2t2KzV0?=
 =?utf-8?B?bDQyVGtxL2hWdjFQamt6bkpiTFA2V3RudVJQYVFYdXQ4TnJrZWlzNzZ1T1JB?=
 =?utf-8?B?QmlhUjE2UjljdUE3aHZGK0FIQ0dYMHEwa3BFelFCbEc2Y1BqaXJ1blczUk1K?=
 =?utf-8?B?bCtyeEVYcUFhWmdWbFM0Z2I0QUN1OXA1RW0wVWVQYVdXZVJxQVFFN1E1VTZq?=
 =?utf-8?B?UW5FRmZkVkR2MDMvOTlpa0tEQnplN3d2NS9XSmZ4V1JmYmxuRVB2UGpkRXBQ?=
 =?utf-8?B?YndHRldXaHIxbGhPVGlBUnZsMnR2d2g3bTUvbElHRVpVZjZhVjNrWlhBOG5M?=
 =?utf-8?B?VHlOWlpTaVFaY29ZbTA1R2hiYWN3L3FVTm1vWHVsYjIvVGQ0aGRnZjNDMUZS?=
 =?utf-8?B?QjgwVGZqcXZLUUo4YVJvSW1TTDJJTENDRnArRG14TmlTUlBMMGJIVzgzMStP?=
 =?utf-8?B?SWNtZ29ZQmZ1WXROamlMR3JwU2dBdlpwMU05U2grU0pDUm5VY04wNGR5dTZ6?=
 =?utf-8?B?NXZYZmVjTmd4SFI3ZDNQMXcvSGd4V0FNNU1mREtLaXFIM3hSa0JYVmpZOWxi?=
 =?utf-8?B?Ymx6dWp4c0NXYVQ2M1daY0YxelRIZ0FXd05GOTI2QVZJTVVDVWltc2VuYzJJ?=
 =?utf-8?B?R0V2bVRoSTZKd0ZBbDNYOXgranVydmlVZDRkWExYdkxrbmpOQTNMaGUyMHJx?=
 =?utf-8?B?aEJ5RmRRSVVuZDVJWWNQcGZuMDE4bTNLZ2RoZXB5ZmFwa0x2MkQ1ViswdTRX?=
 =?utf-8?B?OHFYYzBlSnRTaDlXVTlDVlMrTm9aOGdKNlVIU1g5aEhZZkFVeGMremQwd2ky?=
 =?utf-8?B?TTE0NDNjek5zbmJCN01EVEE3NmxRc0NoVjhkN1B0bnF5Mmh2THhBV0U3N04v?=
 =?utf-8?B?VWRzMlhvY1pHRjMxY3VHVXZWOWRpR1g0U0NBZXFCU1RhUU4vYU9PcmY1Z3Ew?=
 =?utf-8?B?K2VwbDVjViswVG1tUVZCaGlpZi81UnJUL29qSTlNZzVLc2t0R0hmcE4zZlZM?=
 =?utf-8?B?cWczYnA1b1pKc2JuTVFaM3V6bU5va2NQNWxGNFo0Y3lRUVZDQjNnd3NpMzRy?=
 =?utf-8?B?WUt0K0ZVcE1XWDRocytaZU9aempTY29HbGpvdmFnOG1jVFZPNnMxYkJIS0Nk?=
 =?utf-8?B?d3BUdEgyeHhNRXRJcEFMWkUzV1VmcW5mWjh2WUdQekR4VUVkWTlsWFBoaTJo?=
 =?utf-8?B?MnBUendOeEdFN1cyZnYvbloxYTU4RlkwdlBJTStGQXNTbm1GUDlFcmhqM3VM?=
 =?utf-8?B?YVlia2gxNFNXVzlSTklvdk1NOWppYWVkck9DTFRCTjNMMWY3eEVNMHpoeVB2?=
 =?utf-8?B?d1VZTEVlbVJHTEhJdkQ1M0Z3Zi9mUDJRWU13azJzTHEwOGpKbHo4cGJRMFdp?=
 =?utf-8?B?eE00cjhjUmtJQjAvUFJhTGlGdlY1azNkV0xKWkFzM0UrRDF1SGxHUUNkUW0y?=
 =?utf-8?B?Vk00YWpaZXRBWWR4aUFsVFcvVWtJSmRpa21NVGpOSzBUTDdZeUh6aTZyZ1ZW?=
 =?utf-8?B?YXcyeWFvRTRoMlczb09sc0lYd09TMGdua0dSMWtVaUdLbTI5KzhSOWxJNkxY?=
 =?utf-8?B?WjVUMjJaQXk3R1BSVStIdTk1Sy9ZM0hDbFBNcTFkWnhMdkd2UWJGTkhQMHg0?=
 =?utf-8?B?TXlNM1RjUVpiSUI2TUZ1VUlVMm5GRXBSQjdnNm96aDdvQWtKRTZZOU9iaXFz?=
 =?utf-8?B?QVZRYUphQXFHazQxWWkvSUR6cXVsSU5rR0lTNHZIbVJ2cXlWWjJYZkwwMzMy?=
 =?utf-8?B?NWtTUGp3MWg2K0psVGJvL0d6K1NLY0x2WHJFMXFIR1dJd291UE91Q0hzNTEx?=
 =?utf-8?B?VGo3eXBtQStNNGpiOHorSStDTUFLdXNtbFpsVVJsVG9GUWsybUJwODJ1NTJE?=
 =?utf-8?B?ZG9XMkJVUThzZGJxM2dQTFhIc1ZmQ1NJME5td1ovMVl3YmErNVNXWkpkUFF1?=
 =?utf-8?B?YXFLL2ZLT2t0QUFqZncrVVd4RGd1Z1p6YTVKbmtIN0l6QUp4NVJ3dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dad7526-210b-47cb-b413-08de75f8d670
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:07:54.5001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkPin7+XaKbqt23Y8sqr8HlTQ1Z5porG7NhDAXALPRBYc/Xhs6v2/tbn3VKWtj4FekCShqG3SpWmzWVwgaChOddsHplBFj3AWf3IUYvzuK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8054
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 12:08:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9013

Hi Jan,

On 2/26/26 7:08 PM, Jan Vermaete via lists.yoctoproject.org wrote:
> Because the '::' at the previous line starts a literal block.
> 

Fixes: f0c6ba3f46a9 ("dev-manual/qemu.rst: remove obsolete poky repo 
references")
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

