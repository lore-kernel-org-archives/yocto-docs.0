Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D94F3092B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 10:16:31 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41041.1772705785926417325
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 02:16:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ISzsjK3b;
 spf=pass (domain: cherry.de, ip: 40.107.162.12, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIplgpbX3xDOa7vZBYGgBiVlRMwXsE+TJAg9EZ5GL3z1g/GiO6hCp+Q2CsNCS/yN1WlKhgjjLba4odMkOsE9PDvbiIDPxwuWMksfj6SiCqgMzq0jDuU+IF4hEoMQS5tYsQRVW8Naswu70RmzjaiUE278xQjTblZhDYFo15clzTOtzYwpx/RNyqvMi4jamRAw08FcZTbOyXKhZtVAjfAHc//MUXMw5pS7lJL2lAfgdVjgUPd9903+bRJUQO5wyTt9pYcI5pPxtrh54wEaWXfSH42aCJN0EKF7ppKbIt+zEshfv05vcUl+PolfJcIP93n5FEl6rirbr1/W//GP5SzdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeJCG87Eor+ejz2cMEu7uYuDsq5FNkJ5GJaR2V3rqJk=;
 b=vW3Lkx0UWqAJy+OLd4Kq590nRVySEVC48m7pvuityfz24+emcQQy4IQQS66zjJqFEp4JgblkT7hS6OSYDctfdDYyb23h7+7b9r7I51TE4eoT8hdEJArR07xpyle8L8ugo2O9PAdBiRSDz2LEb2HuzyPMLY+NRW43NaSWs63dCqlQld5TNPocMhF5tD6au0q/Jkq+f8qWx/ksYe2JGM/Ug7QGHMgdW490gTcQBolRkZAj1qR9kpC0QrCU3Worh7lAP5xllHKUNV8POg0118ePrs1P4pHBTOlQIpBIgyWQWHdWU7ob6RMvjvKHLWf6i/HryUY03CwBmakW3MBMTHCyVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeJCG87Eor+ejz2cMEu7uYuDsq5FNkJ5GJaR2V3rqJk=;
 b=ISzsjK3bnxjrjKsAAhHHy53FMCosMMrWrJmGK4uWbuJDCBW0EkLiZZ7iZLGz2bz2o0DyoQaON/2hy1HyQnS3Rg38/04pZqckBpdRkNPdTAbNGr1yWzm+6Sxi1w6TnciwR9GCF3gisg1CxqsZKDqZQrXTxyxsEACK/BYARP20sNQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV2PR04MB11240.eurprd04.prod.outlook.com (2603:10a6:150:27b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 10:16:19 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 10:16:19 +0000
Message-ID: <3058d4f6-f8e9-451a-aaaf-7066d1079a3c@cherry.de>
Date: Thu, 5 Mar 2026 11:16:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] overview-manual: escape wildcard in inline markup
To: kichakarov0@gmail.com, docs@lists.yoctoproject.org
References: <20260227214935.15766-1-kichakarov0@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260227214935.15766-1-kichakarov0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0138.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::22) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV2PR04MB11240:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a405c64-2dc4-4ab3-a07d-08de7aa03e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	6bvllosZZ87PFyj1s6hS2DfcZ8rdHIx2MepaCFiqcHL6h/JhnTS23LQtKgP7kVUNZuCGMYYzVm2B/g2czI3DnAvDHoVXTxrI6aRwSHPvkECK4UzyB8o/iJ2r9lAzyuhlg4jiE+NlyRyL7f0skqvH4xUnZqBlFdZtsuneFOCRc3LNRhNIuWuMukIIcf/RLwMOR1WDV4ozvmHQdPze/aZ0yluwekNlg97A6UH+wl/6SX38qGQwd/I2qTnm1oRmeXwvy0RmmlEylaNOcEBJn5DawfO3B4C480antHOIu2cFwmSy9EeIjtyKG3Ng37Lf58o47schTV0fXnbimFf/ZKJ3dhLGpoZeTq6IhNScs+XDL+puKIkGNDU1T2YsDjtlq5zVGGKdit0Twyc9DxN4ZLEPF0YY7FVriwcm6XEKSx4frD2dxvBcl952eeCqat7yw+GLh60bZ6B4LMpMRevdDhCnqfH/SY6bV691oAjiuds9dl/93AIlfWBqs/hsKhWkMRsFXF0BReeMEvHnam+VFbjQQC4sjL+1GJW73XEa7GjIePLrEC0lchs78r+zHSbQtrNo+sOhmxOKQ/Mg8QV9suFjVYxIx8ercRLElC5ueJsuFn7Z1rz6Ubj8Cealu9pQhExjjXDH2j59PdzoEQL2pQrvMZ6sOhsDexIjOzi9Myk/gfRIgvMPB6lTU8CyYVNa0yOP9/x/o/oyeVhJKQqHR0UaNSESi71hOe+0swruoyRucNI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M01hVnpzU1o1RWxzaEplbVV1dDk0aDZqcWV3cXdqelpuTTN2a2Q5WExIc0l2?=
 =?utf-8?B?R2k1ZFRtVndqcTlibWJYc3A4ODhYTjRoeWFzajMxVEtqSHlvb04yWFlHSGVj?=
 =?utf-8?B?eW9VbUs1Z0Nua3JrZHhHRHorWGpmN3NOVTlRbTA4cjc0N2tPSFNWOHNkcVhP?=
 =?utf-8?B?ZDNsTWkrZ0xSQ0ZQb2tXMDNxdHd4ZE9PbkFzWEJkd1J0c21vcytUVjR1bzZ5?=
 =?utf-8?B?Rjd6Q1U4dkwzY0dSV2dkWTQ1SGpQQzVhZ0JvTDV0dkdUSEZ1ODJobEY3UzZU?=
 =?utf-8?B?Qkl0d2dsVlB2c2pJRUVQci9VUmhVRzkwMVF0bnVhU3ZTVmxMSFVkV2VXNzJk?=
 =?utf-8?B?eGU0MjA3c20yZFBVNE55ZmNQNWY3MlZLOG9TQXQ2Y1UxbTlOODBnbllTTGJF?=
 =?utf-8?B?c1M1dnJDTXR5bVA4OU8zVmxEeURpR3g1L1hNa0g1ZEdpaWgvd2NaK1VYNHk1?=
 =?utf-8?B?cXljd1k0L0NUWnUzSittbytHYXZkNzJoTHEwYjA4bjQ1TVBlTjFaa1A1SE5j?=
 =?utf-8?B?NDY3SmZUdEpWUnlwc001R1RjcUdLYUlTZ20zckhTekpRWmtFaUtWVGdHOHFH?=
 =?utf-8?B?VnZGL2VGNEFRTE1oUFZ5TE95ZGphRWpuQlJSRTIya0ZvLzZtYW1MczlVWThq?=
 =?utf-8?B?MmZVSkNVQllQdDFjcjVITkdia1NHSjl3b3VyendsK3cwZmFhcmVyM2lpVERK?=
 =?utf-8?B?ejFYZ01mOXhySElXYytoMFhmWUJKMHBTZElGVnMyaitGSU5PMEl1ekg5c3BX?=
 =?utf-8?B?Ui8zQXQ4OHZKN3FxWkR2U0x0SEZtTlVEZjU4ck41ZUpXajE5NWRuZEplcW84?=
 =?utf-8?B?MnRZOXV2cWFBSVFscTBERVp1dE1kNnVCMCtVSWNHWHU4eTJuOGMyWFJIT3Ax?=
 =?utf-8?B?djVTQ3p1MFdEVjRzZGo3R1hROHVhdUFFaHVPaU1nL2pzOFpkTE9mak8zWjhk?=
 =?utf-8?B?VGJ1bTJyeTJqVWpBZmFsT20xYUxPN2FWU3RwY1JQSkdoYnkwSWFXQ05ZSzg4?=
 =?utf-8?B?NjkyVHNOMSsvRnB0UFU3M0hwMndvUnlRUTBja2w2K0xWbHNkRnJZaXlTT1l2?=
 =?utf-8?B?cnNRa1YzOVBoQ05RYTN3Q1pKMHJWR2dIVUhVM1E4UG8ycUxFdkcvdUNlQWFY?=
 =?utf-8?B?aXA1OUhER3pkVE92WmNERkZOd01GWmJ0ejNmd0VwOVhmUjdCN09TNXZsaHZk?=
 =?utf-8?B?VE45K2hBQ0x4bXJWZk5IdE95Y0dBcWptU3M1M0c0d0Y3T2RoYkovWFUyb1RO?=
 =?utf-8?B?V2RUVDdiUjJCRDdnejhkaVpRZng3dVBLSmhNRHc0b1k2WUlvWjFzbXpFbTdI?=
 =?utf-8?B?MEVaTnA5TFA5cmpZSytLZkxPdFNqckpPNUlEakJBQUd1aHpRcTJBMVVvVi84?=
 =?utf-8?B?YWM0bnlpeVJqWDhHVjZiTjBnaURBZE91eDFrYWMxV0ZJUHZtVjNWSGNDU0s5?=
 =?utf-8?B?Um5HUTJ3WThFYkZId0ovL1dJM2JQVmVRMFZRNFVwR2JXQmhZRUZ4Tnl4Mk8r?=
 =?utf-8?B?ZExkR01ZUURUOGJBdG5xV2JoVTBDNlBUMDNkRmZ3T2Jncnh1a1NzTzNvWEhO?=
 =?utf-8?B?SjJjczBjNmlJcERxMEllVkxPcVozT2dFcVBJb3h0S2lUYjkvQ25WOXhFWnBE?=
 =?utf-8?B?OTk3K1BhbUhNUGh0QUN1aVBvQ2JVNlBsYjBRWVpQRUZGajFFZU9ndVJmaEVJ?=
 =?utf-8?B?V0hKTGpVMWR4TytaN1UwWXJEZW9WQ1hSdEpqb05VQVRINkRhcE5lV1lHU2Vr?=
 =?utf-8?B?SVhBOFBOWGdlNVcrMzUzZiszNUVkYndtcjluTjNTamRsV1dQODd3cmsxQ0Ur?=
 =?utf-8?B?R1Z2MDdJWXVZd1o0UjlEQ2RpV0hwc3dXSm5uNDlmKzZaWVhmUkxVdUxHZG92?=
 =?utf-8?B?Z3N0V0ppUmFPRURsT1VnTCtZN0FITzNPZ3E0NE93b1BjdVJ0ZlNnN2NENTh2?=
 =?utf-8?B?aXpZSGF4STd5dlNhTWtwRU9Sb0dKdzFqMTVtQzNQS3FzSlVpcXNBbTlvZFha?=
 =?utf-8?B?dEpuc2RvejhiaHJhOXFjcFpCOE0rcGtaTytOUENWbUNMOE5YTGNpZm9ENC93?=
 =?utf-8?B?ZnNBdGl0VUlHWmVMUEljZitwazRKZzZHK2JYWkUrRzh1MVU0TXd1OW42Q0xO?=
 =?utf-8?B?UUlxSHZtb2o5TFBBbXBiYW15MGRvS284aGwzV0Z6MnQyMVBzYzZ2SzV5dXls?=
 =?utf-8?B?dXlicUhXbWsrRThUSmxEV0tyN2tBY1hEYUk4eFd6bDJ4eWNoYTJiVHdYY0d6?=
 =?utf-8?B?K2pUY3MvamFtdzBSMzZuL2hPTFJNQkg5TXlBa1NiTVA1Y3J1K2ZjQnBwS0Nj?=
 =?utf-8?B?ZG9PMm05ck5OVENrTkNVRTNCekNMa2tVNXlLUnphVkNGUlI3bTRkUjlzYTIv?=
 =?utf-8?Q?LOHQF28Ljx8biFqVUVD2RufIjZuUVrvy7CzU8?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a405c64-2dc4-4ab3-a07d-08de7aa03e1b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:16:19.0925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEw+C0wcva0+1u4jD6Hpio1cYLDxnFClBzCS5dmDozHHRyxmxHzx0+lU36BNbeDjBvERdTuHH02zp4qpi5/nt2bxWh2CasVxR6o4QHbV1aI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11240
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 10:16:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9057

Hi Kristiyan,

On 2/27/26 10:49 PM, Kristiyan Chakarov via lists.yoctoproject.org wrote:
> [You don't often get email from kichakarov0=gmail.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> This change escapes the wildcard in 'recipes-*' to properly italicize
> the string
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

