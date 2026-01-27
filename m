Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43011D2F02C
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:38:30 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10888.1769521103089287113
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 05:38:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=a1WWOTr/;
 spf=pass (domain: cherry.de, ip: 52.101.84.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkDLcr2nl6ESB/3fIDpeY+yV7BYyMQXAtY+tQFMXOZwFhqXC9iCcysmZ2e31M8tWu0gxLbKQ9JwDHYN2ZL4hYjTtUZCk703cpsolBZr4DdyLIEFAz9E/PK56cEQHSqwA4qOW+2mqi5bPm1HYp3/6VYXb7Nay0JcbVn024mKkfSK8Pr87Rtw+uo6O3rWh7YUTYxpga5eZ8srr0XPbBEChimP8exyG8twjPYtRWIsbDeIP9ALSzF8/LUkZ2kf3DvpmmWMZkVvL7NY6bofpsEaA0S3+cRtZO0wjsiiBBPd1K8VmWyqnIzqiYuSZJjKCiEZqdicjxR/C273bk2wABtmRGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rxwj/TsstOiabKUPEiAm66l3GYN17BAmFS2URQMfMRU=;
 b=CDQ6b9P+CSZ6MbkkJSJiCRl82HYmZuzl5uLdvrN+FHd2EoMHgVbmGeI3hIv3yiu/Oxv4b4kqi+J8u+aKLyxCGVGTiJW9jZ8bM4sGs6eBLq6vphkepj3zuyRxSvu665OGwKkEI7h6jOHmMg6kxtuGIYQSIfeb6cgKrD0zAhWbSAEn1Cm+kASEe0B9SrHI3ix9SNwrIQDVxZ6IXSf0uGmzOsXB8PDwWSp0lgoZwpLgkmFXGbaeiyyi7lyvetPulbhe3tyL4+pVLsFuaSIJkosYEfxDGR9aOiK35xgmrcD8mbXUF59PWKfZqkMwW/6H6NBgY+6P1+VpxmovT+ZgUFnnKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rxwj/TsstOiabKUPEiAm66l3GYN17BAmFS2URQMfMRU=;
 b=a1WWOTr/A343sjpdKIowaSoat+FJ7LtFhL8sMqR//BoNsmywZY/qeiuVFmDEQ3kW7ibFULhqBL5YGpBxAyH4LXqIa5NW59KMsytQFSMId12GngbFc89xAV/SyOtOjVZ3U+on2JbD1iAgdKbKiPuruN0EyVg0btvLKYlHrZ4n4Go=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB10853.eurprd04.prod.outlook.com (2603:10a6:800:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 13:38:17 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 13:38:17 +0000
Message-ID: <02def239-7fbe-4fbb-a78b-919b1d8a4c45@cherry.de>
Date: Tue, 27 Jan 2026 14:37:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 06/56] contributor-guide/submit-changes.rst:
 remove obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-6-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-6-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0429.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB10853:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2f7012-1b70-4f46-9025-08de5da95414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VGU4dlNCY0ZDNURhaTU2bnpRWW1QMFJ1Q2lDN2tBZXNtVU1ydzNaaFhreFhm?=
 =?utf-8?B?TUI3TXp1VHFzQnVnM3YrdDR6YmtIWDNyZ3BBTndKSW53bmkwWVNWdDBKVW1q?=
 =?utf-8?B?dXZ2ZHBLd1Z4eGNhb0h1RG9vSitwVWd3QTJscy9iMjl2ZUh5bTU3Z2luMjN1?=
 =?utf-8?B?OFdGQmpVdkpMUmkzNUNwUGRtWHNVTHo4c0pneDhJYWl2bnVhQ1ZXKzQ5ellD?=
 =?utf-8?B?QjREcDdpZEJkMmQrb0hNTjN4QzJNbmhuYU9BNkptSlFHcml0cUt1TFo2Q29x?=
 =?utf-8?B?aWpxMDQxa3lyVW9IVTdjRjhXY2d0OC9yZHczNGY4MTM1TklqKzVCTUU2YkNK?=
 =?utf-8?B?d1EzQ3VCOHFVNUJCSVNDM1dRVXBLOVRHY05JYUl4NUlDK3V2MzRPK0h0U2dK?=
 =?utf-8?B?SFlLTDJ4bUlNTXVjREg1UmR5NDIvMC9kdlQ5V0lMZjA3czl1cVpiQ3lMMmpv?=
 =?utf-8?B?VGlBeXBLbGphY3djc3lzTHFYeDZUVGFreE91TTRkMCtKeE9TTFlPYVI1U291?=
 =?utf-8?B?VkdORVVnVStxY1JPTm9odzg4RG9jM3JlWkxCZnBOYzlwNTBGa2JkLzNZV3dV?=
 =?utf-8?B?WWNuN0ZUWkcxSHhta3dtclcyeWNXZmdFT2pkVTN2Sk1MNG04eGNiZkFvQ0Zh?=
 =?utf-8?B?QTdXZ3hnNjhxOHpWam1STTNlUXNENm9lSHJCSHRzM1NRQkFMRGcvWStFRDJP?=
 =?utf-8?B?YlFxUDl2R3lYWU5CL2RFWTQvMkdJdWw1ZnlZSGJXQXJxOXJVVlRmWmlWRGV4?=
 =?utf-8?B?b2lWbWkrUFdhNXprMVlQcFBabTFUc0NHV2dDblphYm12aDV0Rm9NNXhqcFYz?=
 =?utf-8?B?ajZVV1JuVHZKb2t4eWZMbzVybWtXYXphL0ZkL0svRTVhOVEyL010TUZMTzFY?=
 =?utf-8?B?WHJ3ZG1YaFl6NndCUEtkcG9FaFVFRWw1K3lqNUlDdmhVczcrMWcyQTZyYVNm?=
 =?utf-8?B?ZTJGWC9jQkxJUW8rWXpoZ3M4VWo2QW9NRTlucUhQc3hYd0cxcFNwTENsZmFH?=
 =?utf-8?B?NHNkMWppaEdVMjMxTXdNdEdFeDBIRzZrZllWVWR2VDFmK0FhSkJ5dWVaWHVV?=
 =?utf-8?B?VlVEVUFwRmlHc2xDYXpPRXNPTnFSdTB3TlJ5cnBZczRmRHBJN2ZZTEJSQUJl?=
 =?utf-8?B?YzErU0oxTEsyVFJ6SEhCRVQ3ZnNtVGhCUVEvVHpCSzdJTWJzSTY3d3BzOWhh?=
 =?utf-8?B?Ym1EK1BHa3duSmsxc2xsVmJhZGNtNGRVOEJzb0s1ek5mMkdURHg4eElrWTFL?=
 =?utf-8?B?LzVENmhsS1NDMUVNMlBrb3lBVjhqTy9aSFQwbW0rOFN3NzlOazRNR01VQ2dB?=
 =?utf-8?B?YlVlRzEwemNsWEFTQVpDcWhYY0R0QUluUkYvRDd3ZEM0VncwUlVFbHFaMEF3?=
 =?utf-8?B?UVlxQ0R3aHFLQ1pWK0ZIOXFqdXB4QmxEZWJIODIrTGREdVJyTkE2WUFkLzJM?=
 =?utf-8?B?VW5pVy9vbXZjMWdKNDM1cTl0bitabnVoWXhrUFlIT2toR2k2T21MbEhpZVNi?=
 =?utf-8?B?ajR0M2pZajdqRmU2R3g3NEFZblN6VmZlNUtWeG5CMldGcUo0a3FOaThTelhC?=
 =?utf-8?B?SlJyd0luNlhacDVZVDc0RzhEK0VndVZodG04ZlBnS2QyVHVzS0dlRmtnSlU2?=
 =?utf-8?B?a200WjZUMGNXL0dKOXJIZmt6cnNXcHZFRXFNaE41L0dVMHhUY25hK3k4dmJj?=
 =?utf-8?B?enpNbUxZVnVpcEtQRnBkUHFqTlk0STIyVGd5UEpxVWpXU1FFdVJ5MFlEQWlD?=
 =?utf-8?B?OURxdU5CWTM4U3F1TlcrN0U4elJNOGk2ZGQxclExYjczWW5MaE1XektzSy9o?=
 =?utf-8?B?U29oMVRSOGg5Rk9zbHBSZEF3NytXcmE2U1JBUDZQYkY2RjVUZmVUWWJGc0pl?=
 =?utf-8?B?ZXF6S0V3bytDTm9rakkrRTQweFVnUXhlNTFwTlJ5YlVRakF2bXJic1JZSEpK?=
 =?utf-8?B?cW9kQ3VkR2U4bGh1V1A5dFN6cXpYRGdEYjdKYVJ5QWsrdDQrTlhUK3FFcGhh?=
 =?utf-8?B?STBSQXdUWlQzb3EvUGRnSDEyOUF4UWYvYWRoUXNxNFNseHEwQkJ3ZTNtMkhv?=
 =?utf-8?B?dXZjdmhnaU5wVnd2NWV2dFh1MWwrSit4Smh4bWVySUN2K1dUWU9CVDM0emli?=
 =?utf-8?Q?l/aE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MWk2ZWRBemFCQktuNE1KOFlaNUtqTFZaa3FpcTh4RklzV05QWXZxMDZGNEtK?=
 =?utf-8?B?RUVYYlZtTER3RFQ0eEdCRzNnanAyQkJLcmU5NU9HaW13N1NFd1JQWE9MdWVI?=
 =?utf-8?B?OWNERVM0bDNzT002VTV4OFlyNU9PdHpGcjdnUDBFUm9wWFZUcExsWlA2QSt6?=
 =?utf-8?B?WUZDSlFIOEIvZmtRVjQ5NGFVZmxWWmVIeUYrUFdpWVkyNkZXOGVTdjR1cnZ2?=
 =?utf-8?B?UzB2R1Uvcjl1WE9VcVNSQWtWQlp0ay94cENnTFRLcWVibVo1MnhpdVdCNGpQ?=
 =?utf-8?B?RDRmVktqOXVtZy9aK055UVVSUDFQRyswR2NremNUd0JMM3ROMmdsRm9PZEVw?=
 =?utf-8?B?ZmZFRFFnL0ZDcVlGS0tMd2tPWjBJU3BJRVA5SDEwcUhFTDAxQkFOYS8vbUUw?=
 =?utf-8?B?Y0ZIcUQ1bzhUUU5jd0NoVjh1TVVad1hIYzVvcTFCclRQcUUzV3NhV2hEZGZ5?=
 =?utf-8?B?M2xqUUFrNjNVeXIwSEVOeWNOU3lKWVYwaUdyQnNiZjJ0NUtQRDM3eWljY0to?=
 =?utf-8?B?OFFLaXRCVktTMmJ2MHdiSmpDVVN1WFlHeWdWMlBOaWFhdzBvZkVKVVlzU0Qx?=
 =?utf-8?B?aXBnbVNNWXBsQnVsMjIxQTZZdEhsS0tTYWY3eGZjUG43QWdFeVI0eVhRQVpF?=
 =?utf-8?B?akFBbytDeXh3b3lXaTd4bmVWWUY3alExYUhFWk1sNE4xKytKZE9ianU5L2tM?=
 =?utf-8?B?WDVIUlk2eHYvc1lKSy9XZ3FtMTc3cHVVTUdqUENJQ0ZoTmJUQnYwR2h4all4?=
 =?utf-8?B?dmlSeEZlMWZWQlZSRjRxd3pXT0R3SkxQV05vZXNlZTlXczUwZ1dpeVIwemVj?=
 =?utf-8?B?Z2JnSjdmWmJTZDFHYTZ2Y1ZiTWZiWkFQWG1LUlNvNU5Bdi9rbERQdFNnYkt0?=
 =?utf-8?B?a3hYVU1GcS9TL3ZqWjllZnVtUGdCUDdGNXN5dDVpQ1ZCVmhyUCs5aHpDdEls?=
 =?utf-8?B?YUJTeVdsVk11TkNuaURHKy9YRGd3UXIrZVprWkNUcG1vVG44cThZUW9ndkFW?=
 =?utf-8?B?SVFaZ1RYNUpybzAwN04zM3Q2WWVSNGs2dUQ4dXVsdERaemxLQTZNRVhrNVZv?=
 =?utf-8?B?Q2E1aklWTm5GNVNWdWJldWRmT0w1NXJ0M3R6TkVDMTYrNEkyM2F0dEZDNmpN?=
 =?utf-8?B?RnB0a1NMSmdiM204d0I2SW9XMnNoT0pvZ0FUZVdQeEJ3YWFpRWRLZnhGSTZq?=
 =?utf-8?B?MlVIc0RZS1Vqb3g0TWFPTlpUbHRiNktZVnR1QzBMaGhUaHpyUjgwTU9qa2gy?=
 =?utf-8?B?Y3BkNys3MUxXa0dEaTBOQzA2c3pvMERvUDdHWXFvTlpQR1NJR3M0UDRYaElG?=
 =?utf-8?B?cXFWT0c0SFZKWUpQT3phdURPZjhYOHJ2S2FuOWtabXVmZUFpT1VpWHduNSs1?=
 =?utf-8?B?VkIwaFpwL3RuTVNZNFl1YThCK0c3ZVpVK3lWa2R1ckJ5R3Q5b09IazdXamtx?=
 =?utf-8?B?K3pLRENrOVRGRjhQNjdzbjJmSHhzZE5IODhwWWxLSDNEcEM1YnR2Lys5RUhS?=
 =?utf-8?B?KzVBaEE5a3A2RCt4L2I1NWFnQlVxalFnYnI1WnozM1dBY1dvZkFHSDkxRExk?=
 =?utf-8?B?Z1R3ZmN0RXBQdkl4WG9pU3R3SE4ydDVzdHBjRzI0N3JKeExJajhQUHRoNEhr?=
 =?utf-8?B?cGlwODNjK3k5OWpWSDN0OWVUOFhPbnNMQUI1TEpkeUZpL2RhUXRCV05TNC9t?=
 =?utf-8?B?c2ZLVXY3dWhHM0RPVVo0RFUvMzcySUZVNVRWNU9EOUV3RUd3Q3RRUG1aUjBk?=
 =?utf-8?B?TWlRYXNQSkVwb2Q4aEFYdlY5ZjVRbWNsK1Y2MFRiWWJObG1hSkVMSU0relhS?=
 =?utf-8?B?QXJFSGdmL0ErWTkwRSttUkVlc0VncFJUZUo4OVlTOS9nT3pEb3Y3TjVnZmtB?=
 =?utf-8?B?RGtHcHRacmZab2NuU25qejVwYm1nSEcxR0YrVWRBbHNhL0xDa1Urbk5oV3Fu?=
 =?utf-8?B?akk5eXhzSDBXczRQY0xkSWtJb3l6ZFNkVlRlMVE0UGsybXo0Tk1IM2xvM2NX?=
 =?utf-8?B?T1Myc01TWmJQbFovRENNcVVsMnJ3SFFTbjlYUE11VFBJbGZnSkRTSFpySDVQ?=
 =?utf-8?B?c3IvYWFZMGJEWEpJUjVTYmw1bmxxOTJtVmFMdHlUK2RKbnRYZmQ4aFlXMmh4?=
 =?utf-8?B?NEpzMno2VXhUUzhseUVmK21vdjJyY1hnYTFaVjN2MkdQNmgydUxISmNaYm5G?=
 =?utf-8?B?ZkRhYXpvYWhKZGFIMlNoUkRTR25mc2hhbzZqcFVEd2hzTnA3UUFuRWJzTVMz?=
 =?utf-8?B?MWFWUlpMN3hEY3doa2pwOGYrSnZwZ1kyVVVIck13azBZVTc4T1BZUnA2ZHkx?=
 =?utf-8?B?RDYrWXF5MEw2bm0ycHRMTHBheS9sOGpZME5QYWVobDB4c28wQ25RdURhRkx3?=
 =?utf-8?Q?I8xZpYip4sV0JrL8ilEbiirGO3ZcvODw7kiAV?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2f7012-1b70-4f46-9025-08de5da95414
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:38:17.5632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOZNTWQ+xmOii7QyXAd/CpRAejVkKiFkXyk3PPaRA6F4N0E1M58bj4yFzHc66C5mpQpAKiADLvdYBhd1YBi7e1lqO9b1Hy3OSp3ntEVEvtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10853
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:38:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8739

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core
> in most cases.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/contributor-guide/submit-changes.rst | 57 ++++++----------------
>   1 file changed, 14 insertions(+), 43 deletions(-)
> 
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index 07989d7b6..4a4c60b41 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -429,37 +429,6 @@ and then based on successful testing, merges them.
>   In general, each component (e.g. layer) should have a ``README`` file
>   that indicates where to send the changes and which process to follow.
>   
> -The "poky" repository, which is the Yocto Project's reference build
> -environment, is a hybrid repository that contains several individual
> -pieces (e.g. BitBake, Metadata, documentation, and so forth) built using
> -the combo-layer tool. The upstream location used for submitting changes
> -varies by component:
> -
> --  *Core Metadata:* Send your patches to the
> -   :oe_lists:`openembedded-core </g/openembedded-core>`
> -   mailing list. For example, a change to anything under the ``meta`` or
> -   ``scripts`` directories should be sent to this mailing list.
> -
> --  *BitBake:* For changes to BitBake (i.e. anything under the
> -   ``bitbake`` directory), send your patches to the
> -   :oe_lists:`bitbake-devel </g/bitbake-devel>`
> -   mailing list.
> -
> --  *meta-poky* and *meta-yocto-bsp* trees: These trees contain Metadata. Use the
> -   :yocto_lists:`poky </g/poky>` mailing list.
> -
> --  *Documentation*: For changes to the Yocto Project documentation, use the
> -   :yocto_lists:`docs </g/docs>` mailing list.
> -
> -For changes to other layers and tools hosted in the Yocto Project source
> -repositories (i.e. :yocto_git:`git.yoctoproject.org <>`), use the
> -:yocto_lists:`yocto-patches </g/yocto-patches/>` general mailing list.
> -
> -For changes to other layers hosted in the OpenEmbedded source
> -repositories (i.e. :oe_git:`git.openembedded.org <>`), use
> -the :oe_lists:`openembedded-devel </g/openembedded-devel>`
> -mailing list, unless specified otherwise in the layer's ``README`` file.
> -
>   If you intend to submit a new recipe that neither fits into the core Metadata,

In this patch, we just removed what we meant by Core Metadata, so now 
this can be quite confusing. Should we simply state OpenEmbedded-Core?

Also, how does one knows if the recipe can fit into OE-Core? (we do have 
some rules as to what's acceptable, must be a direct and default 
dependency of some other recipe in OE-Core, or with a demonstrable 
valuable benefit for OE-Core).

[...]

> @@ -857,14 +825,17 @@ used testing branches for OpenEmbedded-Core are as follows:
>      :oe_git:`openembedded-core </openembedded-core/>` repository and contains
>      proposed changes to the core metadata.
>   
> --  *poky "master-next" branch:* This branch is part of the
> -   :yocto_git:`poky </poky/>` repository and combines proposed
> -   changes to BitBake, the core metadata and the poky distro.
> +- *bitbake "master-next" branch:* This branch is part of the :oe_git:`bitbake
> +  </bitbake/>` repository and contains changes to :term:`BitBake`.
> +

Missing a (second) whitespace after - in the first line and a third 
whitespace in the second line.

Cheers,
Quentin

