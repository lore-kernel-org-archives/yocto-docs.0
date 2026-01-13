Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E29CD277D6
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:08:13 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61262.1768316887274609426
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DzH1ZhSw;
 spf=pass (domain: cherry.de, ip: 40.107.162.7, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnCft3/CWQQpM3QbIMIfEsjIaEfUib4lEAo89kdzmwoe30HNNi5vZ20CsouJsMdBqGQ/fdKnPm+Kbm3mT1X2gD6GLKskQf5FTdG2dcQx2lFloAwVf0bChUloqCuw+LziZmKSY/aBQ+Ll+zZvPHLIh4TWupqNQPyDD8m2OdVUzqroFF6vmWSKtrt8zQjw+3VZ6CSatx7x0c/ApZVj3cH1FOWb3x6hlEQUEYYucgyny5WI+7JV2rBsIHAxXmyPlT83YB/uSN3EdhiLQrOH7IOpvr/D7woEJeTLcFySFS2yNqUv46IzvtD/3gcGV2QH88dfCEoI5OAh5SRixvzNTNjGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shFOzEDnOGIDmZlyStk7IWseTLQilQcBz/5FFvbaNpM=;
 b=K5eDMEXYL5RwaBOGCAzcbWdBUjYGC+u01buPPRY2RYtUhuuAKicQb9XXd5yYL8scrEauw6YEJO3EPLar+PRxt8pUNdeaaYR4zYD0Nqai+R/KOYsnYNFxmimVudBS3VABlqXEiaJf8Sd+Xzj6evrBgST/FnHZDXpb1ziRisFhjstgpkkFR6R3m5tMIHJ4ylMQcmbEu+Qve7UN/C0jkxh1N74nKMJuR+33aziGoBsdOCqOMWQj6vy240rh4T1oJjvBBYMKe/ipD6kOvrnDMnmvFatwSgBlU9qvTpCMSLflOxDYLg0FymWyXGpSdks6BqfW9C8/oDnz1GpBx5vhGGH8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shFOzEDnOGIDmZlyStk7IWseTLQilQcBz/5FFvbaNpM=;
 b=DzH1ZhSwCF04K/dnIGq9g0tkGnMa/iSXD2ksz8DIuq+alNHVq8z/CH8rE59k2r2KDI8g+0+kMQRgixDBt6WgsKKJ/NNuxiiL0qRlA59HmVWgeE7bIolhFScWKF8eA4t6i+xXZyTeh269eIFgvB7Dw4M+N7kTpie6bGp3vfFIpxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB10733.eurprd04.prod.outlook.com (2603:10a6:800:266::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 15:08:03 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:08:03 +0000
Message-ID: <2aa7335b-f7b1-42fa-92ef-19abdd0ac4d8@cherry.de>
Date: Tue, 13 Jan 2026 16:08:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 42/53] dev-manual/qemu.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-42-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-42-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0403.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::9) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB10733:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc59bc3-c5e5-4155-1519-08de52b58c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OEJRY0JVaUQvNGNmWStXcFNlR2prd3pQTk9XNW1OcUt2SlZ6eEhoNzVLZFZt?=
 =?utf-8?B?b29CMUNTREVmV0FMOXE1MzlGL1lJQVJETzFoR0VjUG9xdDFRaG4rbDNnS3pO?=
 =?utf-8?B?S2trY1hOSG1jemdtWTlaZFRRcEF3ckJNZlZWMDBmWEVFcFVCYVppZHBxVHhs?=
 =?utf-8?B?cHNPdE5XeXZEeldHQWdrRjZ6TWU2bFlMWUNlanBWWWRmT0ttTnZEcCtWSVN1?=
 =?utf-8?B?dmZyREhKQWNtMlJrZlpsNUNkYnQwTG1MYzE3V2FBeHdta0hOVUJURVQ4aDFY?=
 =?utf-8?B?TjU1c1U5K1F2UDZTQmY3MFFlaWhXam0ydFpFZEp1c0JzQUt4VzBSdk56T1Rn?=
 =?utf-8?B?NTk1OFZ2Um0xWllHcWQ4eFBXaXJoY0ZVSG9QR1ZaM0ZVU1JTSEJXVGYvekt3?=
 =?utf-8?B?aGVVd3pnZTY2U3BPeC8vNXhxRUlVUEgxbnQwRE5RK3M0SGMyYnR2YVh0M2tv?=
 =?utf-8?B?TzVKeGhoYUJVUUpxZHhMODIvSE16eVd0Q2dOdEFGRWNkVTFVY3gyMENoSXlr?=
 =?utf-8?B?QnN1WktyVVF4QUxvRVpaQUEwR0hlRlYvalpTcXpIckZsYnRFcG5RV1ZKZXlj?=
 =?utf-8?B?MldPNzliSnhzeDhJQVA2TVduNEhTZGF6Ukx2c25ablJYTThKUVV6ODRoUkN0?=
 =?utf-8?B?c0pRL3M1SVg5WFNNWTB0T3F3VHBBQjRHRXZlM0tncmNGaUt5QUcxd1Qzb3Zv?=
 =?utf-8?B?UFM2VkFDTnBYZ0lETjQ5OXBjZ3E0bWt4RnFDV0RUZmZWd2VvQ0NPRk9zSWlZ?=
 =?utf-8?B?KzNaa3hBT2NadXJIdmNFanRGZ1hRWkdhVHlIenM0S2h1eWhhMmxJQWdsSWp1?=
 =?utf-8?B?WUVHeFQxeFhMOG80bXlFTUtlUGdkMGxudE9jbjVpQzZtL051dnZvNGh0Qkwz?=
 =?utf-8?B?dTUxOFBKaGNGNEJYZVNhWHU0STFZdWVEQUxhQWRlSFVZOWc1cW9hSE54d0wx?=
 =?utf-8?B?emllLzcvQ3hQTE1DMThyb0N0bXhCUjlKd2k0Qjg0YVJrai9zRHpwbW5DR0c2?=
 =?utf-8?B?N01OdXBjWmdDREE5aGdlbk0wWDB2Q0JsMWxFS3o0YWtMcVJKNUpjQVhpNDFO?=
 =?utf-8?B?cXhwSDNQUlVIaWZPMXFJR210UmxzNTBRSFd0M0dibHd5aDRhRDlaclZIMGkz?=
 =?utf-8?B?cVpld0E0Z3I2ZDFKVkFoRG45Wm0zOFVjTUVvbExKUHBPMkkyckJPZUN6eWQr?=
 =?utf-8?B?dmR4TFhSR3FFQk5EMCtKcENkc1N0UFJHK2Rua3gzU3FNQkYzUitEaFIwekFF?=
 =?utf-8?B?dlZsM3k2TEM4Y21oQzRxd1JWZEFuYnlOZE9aUVpxS0NtOU9oVHNCUDZmdkpy?=
 =?utf-8?B?TG9rQnpMSVRCOGtFL0V6Z3lWNS9pZDdod2doY09xVWlrWXplZFg0MWFKV1A2?=
 =?utf-8?B?cG1EQjMvVW5lVXZOR1lMclRHY0NrT0RyN2pxbGgzWWp6MUV2QkdCaUpiekJS?=
 =?utf-8?B?R2YxQ2EyK25kZDE0blBYTnFWZldnN0F3eC9iYWQ5S1FtQjFNMnVXZllvUHVm?=
 =?utf-8?B?RWljRmQvZ1JsYXJIUE1SOVo2Y0MySmc2NmszSzVucmlHOVl2WlFXSXNHdWR2?=
 =?utf-8?B?QmxtbVZPeGV6b1hseWMwK3JPM2Izay82MUM2V1lxa0hLQUtWUGJoTDl2WTRx?=
 =?utf-8?B?RHg5VVZFZTNqR2FxUHJNbXVUcW9TWFp1RXh2NXd6bDVaQVdmTlpsekdsdzdr?=
 =?utf-8?B?eldlcW13QjliOHYwUHkyUXpPUEI5L2hDY1YzRmcvM3RiQlBjRGxmMHM2aU5F?=
 =?utf-8?B?clNKKzdzdU12UFJ6UFluUXFNSE9ZaHVkellpV3E5NGNVSXhybHEyWlRWdktX?=
 =?utf-8?B?ZCt0MFdTU2pwZjJIb0xTRG9Vbi9XY0NFRzhEMWJka2t1d0pjNWZMN2Vad2p2?=
 =?utf-8?B?azZUOXJLb0dXamVWcEdBZE5mc01jbW5mVUx6RzRSOFpwbVZUKzBNWUhKMDBH?=
 =?utf-8?Q?vV67LK7i8YFHoLk5QIGjSH0PTYM0/cei?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QUFmYmV0VW5Ld3AxQll6U2NNbGhsYXpENEdWbm1NbjlybmRrNHRTNENsSTBQ?=
 =?utf-8?B?ZDZiRXcySEhMOG1KenAxVTVBYXNpN1ovMlhaaXhsaHBnRkhSb3BWQjQxa3FJ?=
 =?utf-8?B?UkVEbWRHeDkwVVo0WXFraXpjT2tnaDBscXcvOHU2TjJjZ2JEcU9IWjd2NHdo?=
 =?utf-8?B?YnFmNG1YOUlJS0kvWlcyWFhPZzlRNTI5enVrNWdHZHJySVpoVHpQZlk4Mjd2?=
 =?utf-8?B?OXpveUw4SUZiTFI1WDhkcUFCZVpwdXAzRzhaSlNYOXQvb0V0Wkk1N2lDQjQz?=
 =?utf-8?B?a1k1N2xndWxOMml3Y0FscTlpVlhrem8xNHVpamRmYU16bTVFNi83VGg1b1NE?=
 =?utf-8?B?WEVTUFdVNXZUOEdud1hlU2gxc0svdjZuYjVUV1pOQ2xrOWNsRms2WkFuOVlm?=
 =?utf-8?B?WDkxb0pXck0vREtRNlArS1FrczUzUTEzNzZ2UHNxVlJEN0JRNDJSb2RPb04w?=
 =?utf-8?B?SGg0cDlsWlBPUU5pOTlFc3kzUG1yUHY0RmxGc3FydDlwcE1MQW1mQ0VHRVhx?=
 =?utf-8?B?aGlCUG4vL0oxcnRKU011aC85TWE1Sjk1REV5SnFkWnVsaitIQkg0VU96QjRh?=
 =?utf-8?B?bzMrMktyRUdVckEvTzlMOU41TGw3eGQ1WlMwVnQ1VktZZlA3QmFORVFjMzdT?=
 =?utf-8?B?TmhrS0xMRmVlcnRtMjZwNjlVUi9MOWlyMU5qcUh4NHVCSGVuR2l4bE5LOUJt?=
 =?utf-8?B?RllURjlMSWdib0l3UG0vY01aamlGYXJHNmFWNG93U2ZSNytEdXVOQTJLZ2R0?=
 =?utf-8?B?elFud0JlcWxYbnNDWG9OZkFlV1ZYbTNvTGNsdDFnYTI0VVZNVDdOY1Vlc0dU?=
 =?utf-8?B?OXdWdVlaWUJuK0RteFRrT3pxbTJaanRBTnV6TzdHaiswTXppaFZqYmt1T085?=
 =?utf-8?B?RGVZRDExMXNaTmxCZjQyRFZsVmVtOUdiSDBZUTJPYXE3MDUyOE5PQnZWTU85?=
 =?utf-8?B?ck5kVHBLVDZUT1lqa0xXbzVrSHpNbGRRUWR6UXQyeFNmZzhjNEYranlxcmdU?=
 =?utf-8?B?MWNVbnhFOGZNRjQ2SGZJYzM0STdXdjdPNk94TEhFejMrUTlVakVGMERkQ3lS?=
 =?utf-8?B?NVp6dkhaTHByak93Z3Fud1RHaE00RDBzSmJJTzU0SFlJekp4ZXhqRTVibytr?=
 =?utf-8?B?Vk9SNEFBL3lSbU9jTWpobkRaK1JLWTZuZW05SDdqUk1GWGhBN0h4RXRQNUkz?=
 =?utf-8?B?WXJWUUtUYUg0K0tjU2o3UXcrOFhGUkxHYVFRaHhERnlsdWVDdkIwR05hcGQy?=
 =?utf-8?B?NHFFRG44R21YYS82Y256aXAvZzJGN1BGMmd6eFA4NVExbjBHbVFiYkdTU3VS?=
 =?utf-8?B?NXBlOS9jRzdWd0U2ZGFJUHMxODZmMy9tT2ZhZGFBQkhUbi9XVHJncVF6Y08z?=
 =?utf-8?B?cUlnRXVRekVwTGVFZkQzdjRQQWVNVjhOWWJVaHB2ekxyWmRraDJBSTJKUUor?=
 =?utf-8?B?WndQa2IrK3ZFck9CQ2REVWxDcXRTZHl6UVVmMnBHQmhKeGRENFVDbEhiSDc3?=
 =?utf-8?B?OFc2azErQ3NFNTF5UWpXUVgwU2JJVGFld1gvWkxIL2c4YjZNNC9lTlRKSFNE?=
 =?utf-8?B?SVlKQ2JTQk84OWRVMlVMdE1MeUJ0N3Nac2hGR3NYL2VxdlU3dFdXd1k2S1hi?=
 =?utf-8?B?b0RmTnRJMHFEczcvbEhab1RoaDNEaWJPU1NiSjl5VkQ4anJFMVBnclJ4OTBq?=
 =?utf-8?B?YUVUY0M2eEdPR29BTXU0aEswTXhGa3g3U1BOTFNocWRKYXdLd3M4UVZPRnJY?=
 =?utf-8?B?R0NvclVtdFZsN1BoRW54d1JkYysyMDA1a3VPdGFGVk9uKytQU1BiTks3V2hh?=
 =?utf-8?B?SDViUC9OUGZ1UXMrQkJweWNLZmJFRnU0Nkt4T05TRXhMbEdKUkRMOG1jYTZz?=
 =?utf-8?B?d09TbmZwL0tkeWRyVHVtOXBtLzk4cTgvSUNxZ2JYN2ZZYmEyYzRWbkNSSFBD?=
 =?utf-8?B?dTZZYmhGN3F0ckxkS3dEWmlRL3g3czVsVUQvYTZ5YWFocW9SUzJJK202T0tZ?=
 =?utf-8?B?THZZRHZxZkNEYi9SNHZOb1hRcjJ5Q0kxR1dRMnVoUFk1bEZJSUNRV0hTc2h3?=
 =?utf-8?B?eDNxQzk3bkdINDFxTTNwS2IrbGJsTW9WMXphQm1QTi9odzFiZ3o3MEVKYVBG?=
 =?utf-8?B?NncvcUhyM1RvV3cxdU9qQlEyQnBuNE1UUVN5Y0RDMEp1QWhCNFp1Qmo2aGZz?=
 =?utf-8?B?Q3diRGduQ1VUUnF4K1B3R1pzSzZ0UjI2NWNFazY1ejBweHl4T2hRcldBa1ZI?=
 =?utf-8?B?R0ZKZnpnQ1k5S3UyY3dvby95L0l0UEkycURkVzZsOGlvM1BrNTBsaElSSFFV?=
 =?utf-8?B?N3JLcnpFU0JHMmtGakFhM045Y2gxRUZ3bG9udTdQSHF6NXNZYzFrZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc59bc3-c5e5-4155-1519-08de52b58c81
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:08:03.3908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3zZIcxHt5P3dOjiANyk3mL8o/dY9NF1cHNmNYYplXDUi1hmLBi9x1cr/9epW5SLPA5/E5rL+iZXJ/4QnFfkzDVhMozhO3FnV45ACrRJWQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10733
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:08:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8531

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/qemu.rst | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
> index 9e0b8b813..2442b6dac 100644
> --- a/documentation/dev-manual/qemu.rst
> +++ b/documentation/dev-manual/qemu.rst
> @@ -53,12 +53,13 @@ available. Follow these general steps to run QEMU:
>   #. *Setting Up the Environment:* How you set up the QEMU environment
>      depends on how you installed QEMU:
>   
> -   -  If you cloned the ``poky`` repository or you downloaded and
> -      unpacked a Yocto Project release tarball, you can source the build
> -      environment script (i.e. :ref:`structure-core-script`)::
> +   -  If you followed :doc:`/dev-manual/start`, use ``bitbake-setup`` or source

+either?

Either use ``bitbake-setup`` or source

> +      the environment setup script manually::

+with? which highlights (I find) that this applies to the latter part of 
the sentence and not bitbake-setup.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

