Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F22C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 08:52:10 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.76])
 by mx.groups.io with SMTP id smtpd.web11.47326.1743411121352636036
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 01:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GaNsH+Ru;
 spf=pass (domain: cherry.de, ip: 40.107.105.76, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oozTnbEWi6rLZBmCY9VviuGXXLyas3gAteYdimDVdghLEgnobXbXBdM9Uq5F3Z+JSWmBIX6qajY1Cjkbe89/Ul8zjjvvjTPf/DMeb4c2OII11nAdUmkvL1JBI7pGIxdBl6Xmu5IkqADEopoTBbS2CQJf5Bo/GDxm9+HBVBvcDAcBCNLNrlEtbORbqKJzWiI7OvHOaNKjMCUNoZd7d/n5GFDqjlL8O8bgapNra22Y5SaWpo039XcsitONOvL2I/M58g37AAIoE4uAQ1IcOn1do0uTVcucJeVBMH9/f+6E6tJnXX6gbgMYsPJOpaQHSulcayaQthrmp11JQdaRSW+sIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXORgHL0OEweTly4rbuv537eEQHyZyXJ0vyG13wRwFE=;
 b=pfhig7ZlVXkfNLzlUhIjKEHGKQDqwoKrk/Gw+PBbBVGsn+UUTJmGPjzfsTxvlCEgiwoK/4jIASXJ3LAAV/++SwvtBBk1DlhUAqugT9LphebYNhuiWttER+bYQygGBs+ATzXVgvIq+Ggt6LOvxCnmDf41aj3dFz5+GltOQGruS2FVsMK836+okrUtBdkGGOMOPZKNhGapYJWVweVH8ySMU+O8QvSEqR1Lpep3DUqC96m2ixE1YDoIlX2i3Bl5BF0uxuKesE6yTo2fHUyY2Asfq58f0aGuuskQndOkjLxUvMorGvwXOkBiKlVTB8VAboCWIgvuIS1TB+6H5iV7MH+eLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXORgHL0OEweTly4rbuv537eEQHyZyXJ0vyG13wRwFE=;
 b=GaNsH+RunNY9/sDqN8ypAC73Wkpeq1S6O4Uvf/moqxtABAB1yKEsIxfU48gPkbum3S2HV3ANuNHOU5NHS2lMFkNJnafKhsqlmC1VcnFNdpcIt0cNRzP/i8/JtzdrABZs0XOyiQI/L8CUCzaFTXoY8LXkTkoMgO3vsnknomWHtvU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8005.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 31 Mar
 2025 08:51:56 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.052; Mon, 31 Mar 2025
 08:51:56 +0000
Message-ID: <afb1155b-4bb1-4441-94dd-0c4df01d3a52@cherry.de>
Date: Mon, 31 Mar 2025 10:51:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
To: gavrosc@yahoo.com, docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
 Randy MacLeod <randy.macleod@windriver.com>,
 Antonin Godard <antonin.godard@bootlin.com>
References: <20250328205213.93625-1-gavrosc.ref@yahoo.com>
 <20250328205213.93625-1-gavrosc@yahoo.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250328205213.93625-1-gavrosc@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: c60138ee-bd37-4016-9592-08dd70314ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aVFIT2ZoMEhITEE5cHA2OE9DNnRjKzFuV0pnbVEzSkROTUlPV3RnVjl0Tlha?=
 =?utf-8?B?VUU0eGVyWFBzQ3BGdEVBSXkzVDNsang2ZCtQc21UdUgwWndUa0M5b0VtbXpv?=
 =?utf-8?B?N1p2UUk5VHRjZjVxM1ErNWtkRVRMU3dlTzNtMmpiTWIvQXdGbTZZRFhhZmJn?=
 =?utf-8?B?a2g5dkNKUlROL2w4OS95c0ZSYXVZK1FIdW5KNWlFWEh6bkhkUmNtN0U1Y2JY?=
 =?utf-8?B?MWsxbGxaQXJOZVhTOUYzL1l5blVLYzVBYi84dzZDSC9WNHJEanp0QkZYL1hE?=
 =?utf-8?B?SFhBN3VsZmp2NEpxWWZLbldLRTA0VEhMQ1o3UVNjYWhJZFRXWFdMdEZ0RXcw?=
 =?utf-8?B?Y2EwS3R2MGNDRjVXQXZTRkFEdmxEYU1KYkdTbm8rSnowTnF2UVd1SllCWVNh?=
 =?utf-8?B?ZmpkRERCb1NibTFjancyM1cvelRVanRjbitJT0IybC9wc0ZydWRhWTNjL1V5?=
 =?utf-8?B?cmFZaExldWlVQ0dFWStnTkg5RkxQRXlxSVBwVHhMbXcrb2ViYXRZUmlxZ0tH?=
 =?utf-8?B?MklQZU1scHpHenVzcU9wUjBac251Y2FmL0RjVUVyUDNUeWU1RStEalUxejJW?=
 =?utf-8?B?ME5yY3h6dlR0WmFBRUwvMk5wOTJLN1p0d0U2aDI2QWtMbSs2RU5NbnhCZWZH?=
 =?utf-8?B?Y2hXcFlLMlU0OUtrNTdTclpnTE5UZTB0cmtPUks4dVhqbWdRTGUyWGtNUDRB?=
 =?utf-8?B?ODBJK3F4OUJ6WWVReEdDMlJnUUFNMWNUNlVMa3JRR0ljWHpXRHBRclhRVDlS?=
 =?utf-8?B?R1VQVWU1WmMvNVd4eS81aThjOEJkc2g4dFNONGphWHJJaHpNelB6TEtyUDVm?=
 =?utf-8?B?QnNzTVd4b25IK1R2bEhsUEpuOUlPNld4UjZpSE4rYXVRaU1jZGJCbndTcFJr?=
 =?utf-8?B?Y0JQb2pVbEJ3akU0c3dKUlpHUlRWcHp1WVhHV3B6aTYyaWRZT3hLaG5ML21C?=
 =?utf-8?B?RWlaS3JVWHlCalkxc2swMGJ4dGMraElvYkVlMnFHTXVzQmtQbjUxb3phcnpx?=
 =?utf-8?B?bk02QVJtTVpORk5lRXlXWFh4TWRGaVM0TCtjN0tQMEtERW9OV2owMFlianVs?=
 =?utf-8?B?REdyZGlvelJHZDRvUDQ1S1YycXdDY3FNZHJKeEtGRG0ydXVLTGRjQktHdTZW?=
 =?utf-8?B?Ri8reG04VVUrQUdZdGQvVGpjUkZ5MVA5TFZnRzBLdDZVQkhQRGhXNDFsN2hN?=
 =?utf-8?B?WklsRnV2NVdGenBmcEkvYXpHZEp0aks2N3hBNjRlNlMwZmoyR2FxTWZPUnBO?=
 =?utf-8?B?dXlOYmpnUldXcjNnUTU0RElaajBQb2Z4TWc5RFBqZlBKNW5Ua2NOeVVwM3Rt?=
 =?utf-8?B?dHlsVlZ3ZWc2SEF6NHVSbG5tcmdlTkhPNmkvUDNHR2Z4bGExS0pDaDJOVU1L?=
 =?utf-8?B?dWhuZWNzOTBQQU5lUitUZlhTOGZYSURqamlCWFNxTFkwYzZHbFEwN3JQVzAw?=
 =?utf-8?B?RG5kdkNMOWxsdnFXdVZXT09wZSttM3ZaTkVXczhJUUVmZVE5b05pZVp1VVJW?=
 =?utf-8?B?TDZRNmxlcmphb2pqZ1FEa0tURlJQWXd5cGhBYkc5WTV0YXhsMUQzOHlhKzBk?=
 =?utf-8?B?ckRLTUI4MFM0d0dKd21JL21WTzBEa0FjNEdRYW16N0k3MHlaSlEraW53L0Jo?=
 =?utf-8?B?QTk0bmxtUVM0SFZheDdnVWxFc0FPSlloaXJGL3FOLzA3SFdqZDhTc0xONWxQ?=
 =?utf-8?B?SjdjTjV6TkRNUzB0TjIwR29WcElBK2NXWWs5azBLbUorb1JaVGl3TG5jdWgz?=
 =?utf-8?B?SE56S05yVkJOS3poZldGbFhUNzZUMzFFUFdkbVRTZGtXZE1tME1Rc3Fycnk5?=
 =?utf-8?B?Mm13R0FVeE05aDhYNHY4cVJnTzR0Vnl5QkhLU2tWRUp6QTluejVoei9jYWRU?=
 =?utf-8?Q?HAlGEeb/WxCRD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEhpNHpmcXZDY3F5dTlzWVU0cjcvQnl2RFozUVJwNlVmS1N4YzR0VXVmYThU?=
 =?utf-8?B?MUpFUW5iOGt3TDBNckRWdTFFWXEzVlhRaGlRT1o0bVZYWmtXNEFQQXdwRUNu?=
 =?utf-8?B?am5iS0xBcUt5MEFuc1VhbkE2bkxoYVVENjJ6TFZLcDVyNlVQN1hwWjI5SUxv?=
 =?utf-8?B?N1RTUldhN3U2QlhVa2xmWEdTNVMyUzc3Sk1tSURoNmNWTkFrek9PNTZFYzBt?=
 =?utf-8?B?S1l3VUVFd3dGUml5cmowMHdQeksyRkJxdm1WYUVLc0dlYUpaTWJDcHk1ZlVp?=
 =?utf-8?B?R0tic2ZqZUNSbTkySmJWbERoNk1FSFpjY2JPOHV6MHo3bVhabEJmWWNIS0pX?=
 =?utf-8?B?RjBIR3licXdoNGdtemxaaFhzUnNaV3AyVjNoYWZRVW5kWW9ac2dIaVlhMUJS?=
 =?utf-8?B?dGQ3NGlHQ1F2RHhtOGVsaTdJWmowNmFLVDlWenFaYlY4MXVrdjlrQXlSNlVT?=
 =?utf-8?B?TUFMbWp0ZlprV0lnVUN3cUlpWEhLSmRsWk5xbGgrdkI3d1pMRlRaL2tGS040?=
 =?utf-8?B?U29OZlIzVSs2ZHlUM2VtUVFPZ1VhRE0weWtXMUdoMjlNTU5pRkE0Wlo5NFBu?=
 =?utf-8?B?dE11czdQN1lsVmFMZTNvcWF5RGVZUzgxTFhwTnZWdnZFRklqVk1PVEFRRHVj?=
 =?utf-8?B?bEI1WHMxSFo1U3ZQc3NwVEVXZ1Z0UzJLa2F6dHNvSUViTDUvVC9ETThLSjY2?=
 =?utf-8?B?eGZxT05UdFFpM2t0V2czc0dTcEVRb1ZwcG40cmszL0Q3c25aNis3T0FxNmZn?=
 =?utf-8?B?Umx6YkxmTzZ1cVdzQTE1ZEl3S2kvUU9YcE9Iak80UjBtZm45WUJnSTBNNmZL?=
 =?utf-8?B?OGF2c2I4T241ZG1zZTVNZnNZd1RpUDE5SWNlZEVqTnlESmg4SkovOWxwQllz?=
 =?utf-8?B?akxsdmZsNTVWTTRmNVlLY2lxWUJqYUpCaHM0Q1Z1LzVjQTMwdGxGblIrVmdR?=
 =?utf-8?B?RFRPU3BMM2xrZmFGeitWSkRMaXRWK25HVGFOSkJlRXBEeUlNclg3bXhNTUY5?=
 =?utf-8?B?L05rTUZ5UFBrOTdwcUJyUEFDczBFL20vNEh1emF5YS95cjhJNE41TFhlWHZJ?=
 =?utf-8?B?emN6N21nK0R1L1paMmo1YUtqaVdqQmtPOTVoZS95RjFRYmhwQjJJMzdNdHJK?=
 =?utf-8?B?Ri96Rjd4Vm9NanZWVVVMY0ZtOEFGOEhsdkViQXlpS1hlQlJKSEFkQWRBNTM5?=
 =?utf-8?B?TVdKQXluWklheUFmN2dGZkJ2U1hqTVdvemI2NEdLMGtQM3h1U3dnUTR4WXli?=
 =?utf-8?B?ZHUzYk5MdkFOTDhIVUkvbktmSGFhS3lZczBvTkdqL09sU1pUTk0rSmxTczJH?=
 =?utf-8?B?UkZia3RLNzRIdXZVNi81SjFUVjhjRjlISmpkOVN2c21VaDdWakg3T0FoVzdv?=
 =?utf-8?B?WjQ5SGZwUmo1ZkVBcDdZYUxiS2wwTjNESWx2c0xmQmhiZXNiVHU1NTNUWmxR?=
 =?utf-8?B?Z0xhZkZVb1BQbnA0OE9GT0dtWkNDSVZYWCtwMjhKdjlOazZmMGdoSm5RWExI?=
 =?utf-8?B?UkFKK0lyRUxXeU9YczBBZkZxd1dYUlJBVEVxcXpqbTdKZlRyT1grdExjV1Nv?=
 =?utf-8?B?cWRicnZqWWR4ZnNsVk5SMlV2bVBvS0VWa3FLcU40MGdocVM2UVFsWHhoTjMz?=
 =?utf-8?B?QkxMd2pyV1VVcHI1ZVlBUWRJaVZyalNkL1hYWENwK0NwTzFDUDhjNDhTdXZr?=
 =?utf-8?B?dlhSZUpCWVdpdG9TMWpBS0drSkt0MVhOYjV0ckRpTHFjY1JqRmJCL25Ib05w?=
 =?utf-8?B?WHlkVDRSWkJWb1RRejYydGgzUWlKS0l0VlF5SHVGcHhaMmNBV0tFd1NpTmRj?=
 =?utf-8?B?Wlh2TGJ0TmR4RHdRclRvaWd0MWN3SzhWZVFTeFY5b01ETHFZT0xtdlgxaWRm?=
 =?utf-8?B?Y2FaVmQwYVRTK3h0bmoyMzYxSFBoSEwrQkp1UndxaWJoMXp5YXFHMXpETitS?=
 =?utf-8?B?dVZxT0Vtak16bVJFUUxSeHZUMlZuZHRlc3RQNDBDdlA4d2ZNQlRkTVpXSFhn?=
 =?utf-8?B?UG44TjA1TTdZM1NWMk9QSUFQZlczNlhrMWZIRk51Q3Y2Ymhxa0VLNC8vWDlo?=
 =?utf-8?B?VjZsM24vS1hkamp4c0ZqVDFRclJMVG91OXV1UjN3NWtvWUFwZWtuVCtwN0d4?=
 =?utf-8?B?OTdmbHlKY0hsT1lHa0hsRDh3RlFKUnZZdmQvVUNMTHA5Sk42azc2RUN2Znpa?=
 =?utf-8?B?Rmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c60138ee-bd37-4016-9592-08dd70314ab9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 08:51:56.7164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5aaTAVP9EP9FuJqA4voL7F8ZUVo2jQV0qAuotCpGBXXxEfOBgyN1+b2V/VCD+cHYs4z+Q1vF9alTt6MsGdrY54RilWPTMtCqjkwGhcCQYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8005
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Mar 2025 08:52:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6683

Hi Christos,

Thanks for the patch!

On 3/28/25 9:52 PM, Christos Gavros via lists.yoctoproject.org wrote:
> This variable specifies the maximum allowed size
> of the initramfs image in bytes.
> Fixes [YOCTO #15797]
> 
> CC: Yoann Congal <yoann.congal@smile.fr>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> CC: Antonin Godard <antonin.godard@bootlin.com>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
>   documentation/ref-manual/variables.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 62e339ed8..c9c042096 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4474,6 +4474,13 @@ system and gives an overview of their function and contents.
>         See the :term:`MACHINE` variable for additional
>         information.
>   
> +   :term:`INITRAMFS_MAXSIZE`
> +      Specifies the maximum allowed size of the initramfs image in bytes.

Is it really in bytes? The error message specifies "(K)" which I assume 
means those are Kilobytes?

> +      The build will fail in case the initramfs image size is bigger than
> +      the value of this variable.
> +      There is a week default value assignment (INITRAMFS_MAXSIZE ??= "131072" )

s/week/weak/

> +      in bitbake.conf.
> +

I would suggest to reword like this:

"""
The default value is set as follows in the BitBake configuration file::

    INITRAMFS_MAXSIZE ??= "131072"

"""

to follow the same convention we used for other variables' default value.

It's not entirely clear on what this limit applies when compression is 
enabled, on the uncompressed content or compressed? This needs to be 
made explicit.

Cheers,
Quentin

