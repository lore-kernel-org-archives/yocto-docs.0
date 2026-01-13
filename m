Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CB9D2D109
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:04:42 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59440.1768313082062212784
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SVhvE273;
 spf=pass (domain: cherry.de, ip: 52.101.65.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFp1W1Or89gBLjMnKH28SkJHgAME6rpYfBDFd2ElFDvHAkUfJTZTJBkNbhuZAP0/kKPXNd62FZb4cAZtq0Pxd+fhvO6z73ElNlY4xdWjJs2/wdaS3/FI9YSQMYyi4qRgLShz+CdP+tdS3REHZYSgfWzBaKFxdWBCRs0ZOSlAW5U4gQRDONhBTAgPl9GC7amxCstvAzB97qLa4s8oxdhG3U2EQjffCSgV0uRUjxqFQUjexCayfSuH2S7hr3oWWCBVnKYHZq4O6b5iuQPEhRqO/84+WQf0xFa4PBYI4vJhl6zqS1XCeFm4i6XH/s/ug3hcKwwV4QUcxFManMxwAhZ3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTMzaN3/T4nU3+WADU7vguo5AGXLed6MdUV57V/osMU=;
 b=qC4LOzeLXIo2h75966HTDkfqX2xDQho8samECr3yJz7JSe/Qd/t5vInlHnOjXEIO8+rXtv50mkLA/gY6ASPQikmS4aVHsF6RMYkADmGzGJEKjXmgK0/+vPOoeebkOJ5P4YYBFBlC9ZDjgrDHlolIducac0vNA0RVJbw5nJixgp4UEyQ2gvC6wRW8JEpIN3uRGTzol3tlidOxFFKgD8IVv/NhF3TlrNkBNFxVez2k1HLIFtTcywV6qD9v4oTZCtX/w5bVqHqyZsjHZRVjFY6dD41s+s9yA2p1HNZLl3nHZ+i4fYpdOtUqLGOu5yBsHmAipGVdwz7dFI4TDK9GW61IrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTMzaN3/T4nU3+WADU7vguo5AGXLed6MdUV57V/osMU=;
 b=SVhvE273MODcHx8kIFKNP/kqwHmwCDchjSFyCnbEJ2uVFkAGV39UM9/ESFnR6lK3ayemzCKn6TF/4L5Azj27sjibMUvuZCYTtkRGZlqwbtxPnJVF+Fw8w85tTrJlFxiP3cawk0Sz88LQ/W+vaf61DB7Rc+oRdOtUNzyVpFiOUNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU2PR04MB8999.eurprd04.prod.outlook.com (2603:10a6:10:2e2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 13 Jan
 2026 14:04:37 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:04:37 +0000
Message-ID: <3d4b8042-268d-4d71-b5c8-9152417c3698@cherry.de>
Date: Tue, 13 Jan 2026 15:04:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 25/53] ref-manual/images.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-25-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-25-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU2PR04MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: 767da56c-accd-4d97-ba78-08de52acafb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZkJBRGF0SUViQ2NiOEVub09wN0NoNFVzZzNKVXpnS0NDTHhaSm5mNTZiRmpp?=
 =?utf-8?B?ZlorRzhsOEtieExTU283VDJQVGtnL3ZTcFNXbFNwaEJnQUpiZWluMmx3UERM?=
 =?utf-8?B?WjY1RUZuZFJCcU9Tbi9SL1B2Y0J5MjhxRXoxTUdUWFpkcmZrOEFTM1g0ajEr?=
 =?utf-8?B?V0RRVXN6a3p1R0txaEp2VTN4RU1sY2tLR0xHbkFGZFZ0d0p5UEJrUERwcmNt?=
 =?utf-8?B?SC9CWlIrcGxVNUNqNm11UjFJTnh0R3RiUDlZN3cwVjh6S3pGOGt2cWVTdFVB?=
 =?utf-8?B?QThMSms1N2RMTEc0RHVGbUk1OGswbW53ZG4xNkxBRzdIU000UzFRUzNyZDl2?=
 =?utf-8?B?N21IeHkvVzcvMzJtbVRHMHhMbE90UjB4WG04blVqQkFIWVpsQkRuMFF5OTNi?=
 =?utf-8?B?bEZxVEZVMlJBQmtES0VRZ2VMUUk1MngvcDZvNjhLeFpDSnM3aGF6bnRoaFBl?=
 =?utf-8?B?NWpXOUZZdkdLMFBPNHZoU2JvYWZzenBDNmJ0bEp3WWZacW9YSWZNRFBySHov?=
 =?utf-8?B?TnFtWVUwOG5IOHZ2Q1RrcXIzRVpTRy9VeUpsVDJGZnZpWGZmWEJlSExwMjlv?=
 =?utf-8?B?OG4yT2hWUDQySEJHWGgzV2hFTElEQzZWWUtaWk1pak4zZEZBcHdxV3FhNmZK?=
 =?utf-8?B?TStKazEwY0c5em5IMkg0YjkvWndUVzY4dlJEb05IdmxqOS9UbmU0WXpHWlZB?=
 =?utf-8?B?ajVaR3JXUmFvT05jYXRzZTd5eFBXRTlpTnZXNTBMV2REbWZyUHdmZC83U2gv?=
 =?utf-8?B?TWptaGQ0eUtQZkUrZFhUSEJOOHo3K1ZWK2hON0hhOXFHU3JydDROOW5NTG1h?=
 =?utf-8?B?TlVFZzA1aExCVnpZS1FWcXhUeVlMWUduTVpRSXA1dThoVnJoRGh6Kzc1VUUr?=
 =?utf-8?B?MEZNT3RPT1crOUduNnQwTDFjQ3N5a01XeDJmT1lycTMyMFhDY0ZFN0Y4emh0?=
 =?utf-8?B?eFdldlVXNVF2WWhUZHdNbXYwcjJwV2R2cTVQbGJTZDJUMVpoMU9pNGlLZmQx?=
 =?utf-8?B?U1BtS1llRHZhSmMrTTh3NXhWUnZXM2tZU2UxWWRpcXZZOU1jNGVPb1NkMGlL?=
 =?utf-8?B?SXc4dTJaTjBKUlJLL2lnRkc0T2wzNUUxeE9EK0dmUkY2WXEyUXJiNXRtRmhV?=
 =?utf-8?B?ZDNJT1h1Zm5tZGoraVNUNlpoNHB1RlhNS1FBZnIyZW94by90WnJIcjBrUzJG?=
 =?utf-8?B?TTJYQXVlQkR6bEFRQjNiYjRKOHdmZndEYzZhbnBPaHBPaG5Iem1aSy9aSTZS?=
 =?utf-8?B?NUp1Z3BRSzdxT2FXL0VrTjhHbnl5bFVLNkxDdnFVZmV4QVAydjV2WHRROTJQ?=
 =?utf-8?B?N25RMXRUekgrL1ZDVUk0a0RPY29tbXUwYTlIbnEzR0RYOERvRmdiaVU0cjEx?=
 =?utf-8?B?YU5RbUU4SUxMTi9GbXN1V2Mzc1ZsWUV4MDhvVStLdEl4V3VuZ08vRG00d3dO?=
 =?utf-8?B?NVdkbEtuVXVqTEMySEJqRVdqSWp5SHhRdzVHS05tc3k5S3ZGVkRrMUMzdlhK?=
 =?utf-8?B?SHpQUThGRGJkVnBPUWVsN3A1L2RSS3Q0U0FDcXkwUXcvelJTM2x2MTk1R3VJ?=
 =?utf-8?B?NU5OOXR1alZORklBNUhVMWlhSzJQUUtZYTlkaFFESWN5VHQ5NE5oNXRWR1B1?=
 =?utf-8?B?VkJJZWl0QkVyUFZybW9lNXh3YlNuL2tNNVk2MWJiN2xmeWdKM0FzeVpOQzJN?=
 =?utf-8?B?VElJY0g3WXFoYkg0NmR4eUk1K0NIbmtLd2Nxcnl2dzJEckI1Rlc4SVltZ3VT?=
 =?utf-8?B?cWFMVjVDbm9LUis1anFXWWpPa3hEbk5LeVhndy9TdzRxL2ZNbkNNdWpVNFNk?=
 =?utf-8?B?d0NXdHNsVUV1Qk5WODdpUlQxRnJtaXg0NTJ6elBwSUhaTVRXUndLRXZyYktu?=
 =?utf-8?B?YXpkTGhXanVTNk13dzNNcUQyTXFPVFVOOHppcUhKM2NFWE4zNW9XTlJ3amtZ?=
 =?utf-8?Q?BomciC2xHlVbWgbNBmCPL29N8ydOcQb0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0QwTlR3UVJuZlpZTjZhMEVjUnBPYUdyc3Vhak5pZjRBZVpGNkhNR2VyTkk2?=
 =?utf-8?B?amhZNmRmUTAzYlAyTFZvS2J5S1Fmd2ozRzY3akdkdExVMWgvbURtY3AwRmht?=
 =?utf-8?B?NGpNL3ZCdk9XM2ZtdDBHa3NzM0kwcWw1eWlHL2FYLzB0Nm9OdXlLcVJ1Zm4z?=
 =?utf-8?B?YmUvNis0YjVoRlZLSUxWKzdHTXV6TDd6Wm9hSmdpTUhZSWRYOEpvMWJ3UGVk?=
 =?utf-8?B?SVRkakJaTDYyK3Zrc0ZUL212UGM4OVp6ZXZCRkdlMWF0QmpQVVhwcFBrZXdn?=
 =?utf-8?B?ejV4SGVZczFZN1E5UmExbUNUdlVrWEx6Ync1VC9IeUsvZ3FHZm1pUXlucVJ3?=
 =?utf-8?B?QlJPSjBNdmxaU05LWE1LRGJBNUtZNklRS2wzUDBieHNtd0ExMnZyU054Wm4z?=
 =?utf-8?B?TEV1MEV1MDNSL0ZqNlV1QWdhMFFrQS9lYXkydWE4ZTJiNnVNOXlqUU5GdzF3?=
 =?utf-8?B?Zkl0K3ByMXRhQ2N0ai9yVnpoV1hWR0RVazhxVEJwQ0RZYndPd3dSdE1KQUt5?=
 =?utf-8?B?M1o0ZVI4aWZlVVNZR2NtdXYzRUtsODRNenhHSnR2UUg3Z1l4OHRlMnM2REVt?=
 =?utf-8?B?VzlyNHFuRHJvRHNyV1JLUklkSFh0VUFDRklTQ3kxTHFRSXhaNzdWMWF4Wjh6?=
 =?utf-8?B?S1ZTU082QzI3RFM3QVNaZ3lIM21qUDA0Y29BQlBPWnptSFdMdFBENlBWazFz?=
 =?utf-8?B?dTdKV2YyMmFtdzMwLytiTU9ld3N2Y3N0N0ZFMC9welFvR3BuSXN6Rm5uT0F3?=
 =?utf-8?B?MXhvamN1Z3h0V2U0WUJZTGxSSVkzYmNpMGRXVG8vR0lIRGg4SEZGUFN4cVRE?=
 =?utf-8?B?bUQ4cWhDNXVML2o5dDRyVDRqTTZ6Y1JINlVuUTJKOFpMRTJ1QzNGZEl6T3NX?=
 =?utf-8?B?ZElIbTdNbGxpNDFsOTZkYlJ2emd5ZWdCZDhUQ1pUSzZ6dENoVWhIRmNhMVJt?=
 =?utf-8?B?MDRVcXJlajFzL0ZkRm1nOWxjNCtrMmt3RkV3dTVLalhiUUdwbm4vN0t4eHVq?=
 =?utf-8?B?NG8rUTR0U3VsSGs4aFFKc1JpeVVMcVdBeWg5cDByQmRsRm5jQjhaSjNYNDBa?=
 =?utf-8?B?L0tiOEIxaWdRei9UNGovdlNaNUgvQ2dIL2lWQ1ZlODg1QlJUTjNZbGtuTHVo?=
 =?utf-8?B?V25SQmRGcHZobXFPeHhsaVd5b2tIMkw0aE16aUVBU1JPdWN2RUZ2bVdHRGhT?=
 =?utf-8?B?a2cvVzg5SllZbklIK0FyUXRmMDNzZHZadVkrRjRaR2hZVDF2VzNFVndRb1Z2?=
 =?utf-8?B?WGIxclIzL1lRbDhjNS9reU96UlltZExCeklvZW1rRjlYYUhVNjhMVGlMbDZz?=
 =?utf-8?B?UzRwV0YxaldlUzEvMmQ4c0l6NEgyd3FrTkdjbHA1UUhCb3l0QWxSUjdHaW9o?=
 =?utf-8?B?blcxVEtrS21mUXgxd2YzS2hnL29SMDhqSzJ4NXY5WEhtNUNpY1NsMzNNM2Q3?=
 =?utf-8?B?Wno3WnBWQzVPdi9hek1TREduWG4vMmVPTkY1VkFsU0t1Z2pna3VoWDVVNGRu?=
 =?utf-8?B?UXhhbzRPZUlYelVZN0dIaFRRdlRxNU8zbExqS2JPVU5HY2kzOUJKWURpdlZp?=
 =?utf-8?B?bFJZdHRqR1VCYU1SQ0Qra1lQTGIvdXlycFVYeXhla1FOMkR1NXdYRXlsNjd2?=
 =?utf-8?B?Q2g0eHRaWU5FMmlYblBPU3ZsdEtFZ2l5SkFaeXB3cEt4dzI4eHk5b2FxalNn?=
 =?utf-8?B?RjdkeFBiaGVkZHVWZjBNaDZzK2pMSHh2VkhRclppaVV1eFN1c2ZUUVd4d3lG?=
 =?utf-8?B?UUxla0J2eW5mNWFhc1RjSUwxUWJqb04zZGJjYmZ6MEIyRWhIMXdDY1RCMFk4?=
 =?utf-8?B?d0VvdXFISGZ3eWttRXR3OTc1RGR5ck42VnpNUW5IeU14MnN4Z0dvUkp1bG9v?=
 =?utf-8?B?cy9DVjkzWlZiUDlNUmhhY0NpV04yRUtQOEZPaE1nSTJqSVlnN05OdVZuUDJs?=
 =?utf-8?B?aXBiQ0RxUWo1QVQxOGFhUFdHY1ZYNDVZV2NNZ0FZdzVXL0lNcGRVMFdGczl2?=
 =?utf-8?B?ZEYwYm5SSHMvcmNReFVJdDdWSktWT25BbE50NGZ4cU1GY0gzQzJnU0VUR3U5?=
 =?utf-8?B?VVduWFZYbWlxL1R2WUc3YW9INGRLeVY0Wnp5MHpHQldCbDhjekc2eCtHYzRN?=
 =?utf-8?B?LzdhNUhBaVV2RFI4K3NXRnMzSGFsbnpVTlpoR1I2ckpMdzE2a3VuRmorb3FM?=
 =?utf-8?B?ZXE5ZUpGNzh6akNueXVsMUc4UlVMY1VleDRpaWpjeTBQWUhXdENqekxGcmpS?=
 =?utf-8?B?MEs1c29OWTZvVDJvNWxFNDQzbGM2VTlMaHBQSS9QZDhFRU04RTlucGVCNDBy?=
 =?utf-8?B?YTREdXNuU0x4OFRmUnhxbHNhUGF6NG9Va0xySW1yTmZsK0FndjM4Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 767da56c-accd-4d97-ba78-08de52acafb4
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:04:36.9807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rosP/Nx2/tjh4hMJ5kjXtXwpbxh+/zthmps44iuOD74oeCsBFQlLgQpOsGaMTI3AYG4GCFV0m93X8ywIcozqg2pw/GLptlmh+XmEDHa0luQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8999
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:04:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8514

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/images.rst | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
> index c9d898926..94e412de3 100644
> --- a/documentation/ref-manual/images.rst
> +++ b/documentation/ref-manual/images.rst
> @@ -26,9 +26,8 @@ image you want.
>   
>          INCOMPATIBLE_LICENSE:pn-your-image-name = "GPL-3.0* LGPL-3.0*"
>   
> -From within the ``poky`` Git repository, you can use the following
> -command to display the list of directories within the :term:`Source Directory`
> -that contain image recipe files::
> +From within the :term:`OpenEmbedded-Core (OE-Core)` Git repository, you can use the following
> +command to display the list of directories that contain image recipe files::
>   
>      $ ls meta*/recipes*/images/*.bb
>   

This lists the image recipes, not the directories that contain image 
recipe files.

Also, one could simply run:

bitbake-layers show-recipes --inherits image

to know about all possible image recipes one can build.

This is unrelated, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

