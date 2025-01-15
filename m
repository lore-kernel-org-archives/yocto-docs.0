Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061B3C02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 11:29:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.72])
 by mx.groups.io with SMTP id smtpd.web10.18659.1736940553954093962
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 03:29:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hel9vQ9o;
 spf=pass (domain: cherry.de, ip: 40.107.21.72, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y286xil9Zl2RveBfLx/kN5D7Vj5m6omRx5JmjkR5mwm7L2KNy/26wCNUG13nEcud6ucQtGr5XsFfbE9teW5ad5erIPdCHC8mWLrDIYzf4apK8fvus5K2Yu6WdvutazkQmdRp2wBMycuON+/tkRotDBrPQ+5hUBQgiVmFQbHy5iIMLjC59ijXAKNS/3BhuW9GVCusLX3bM10v/hf+BKopj5/cAGODDPp6+YrF2C39GdCJFmZe0/yYR9FwYQ31PKdaPRsHDxsd2nj/NPZm6Bu9KbNOKugbfJafrOtKFBtcAZUA1Rl5jNeg0h8VfE76i7w4o9RceQHSE+/iOK/ftUfk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnl+bjTPwSj8u/QRqfX3sHLDNF7SUY+bcw0DYXdVIzU=;
 b=m3FlUyfNQzGHaswZKJRmnBpYOjecAYgUx6bS0mwuwBEZYnOQpm9JKPC22C7RZjaFrHE1RY6sLjEAbIDybYIhiqgvixLfNC5+84xLhbKGwa6hqi1iOhO91j4JCJN7kuC9O/rd7PG/9ZuVJZacyMcBQtoDyvn6UrEs1g6JCttBeqS/w70Y7SWQGvEXf1+51ueuTnX7jXOzC0apxizDM7MkgxOOqv/0RMV0dpOB8q8dDIZjSLDRRwywsj8dcvY6p3+WtjHfJzipeZIHeT/5TTI1TqvMprxh4VSgCZxCaUuksd8Dz3JvnSqr8L/x8MuWz6S1C1ItfKV8UvpBGkHFGKL16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnl+bjTPwSj8u/QRqfX3sHLDNF7SUY+bcw0DYXdVIzU=;
 b=hel9vQ9o3mtdL3hUV+9DSpuJrv9r6N2TwoduGHfOBOJcxJ+QYzP34dJ9kdhjXSgjtZUtXJh7zBcHKxOwN4/Z7POH2rQK2E2Lwa3oW2s/ze0FylstDOeBikFjl/vKATmW6/ewGympY++PjpWBZkvs8EwNeKLG1KDEQwClR6CRarc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM0PR04MB6882.eurprd04.prod.outlook.com (2603:10a6:208:184::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:29:10 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Wed, 15 Jan 2025
 11:29:10 +0000
Message-ID: <eb09276a-c9b9-4bc2-b628-782344d42f71@cherry.de>
Date: Wed, 15 Jan 2025 12:29:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v4 1/4] migration-guides: systemd.bbclass do not
 add Also services for 5.2
To: adrian.freihofer@gmail.com, docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
 Antonin Godard <antonin.godard@bootlin.com>
References: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
 <20250114200734.4191354-2-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250114200734.4191354-2-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM0PR04MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c93185d-2562-44ff-bb3a-08dd3557d497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SS9IUjB1U2NXNGNqcE15cGs5dUt5RHFTOFdxc0FqSUM0Uldmc2h0cHhiV05k?=
 =?utf-8?B?QnIyaGJlWFFCRHRUMW5HUEMxM1R1V1krMVFzcWtYQm9BS05KRXBXTjJhRDZT?=
 =?utf-8?B?dVR1Zm4vUFhFb21waHdzbmYyczBaRVZhWTdIZ0tzZDM0NHZuS1BmVG1QVFI3?=
 =?utf-8?B?K1R5Vk1OdmRRMWxlbDdFbW9KZUtDUlRDM3BmVkJCUFdBZ3J5WHRVcUw1cTZ5?=
 =?utf-8?B?UndFdVJ4Z3RVa0JmUkFSWTcwaW8wKzU1cmtyTW5uenpMVFoyenFQZ09UNTE5?=
 =?utf-8?B?dVZ5OFZnbUk0OFZxU2hxOE1KRDNLK2o5R0RFRUdwRU1YVElHZ3RZdG9uUWhI?=
 =?utf-8?B?QjdvaUQrZ2IvTzJpZnh0L3Q4QWFndlVDUHAwb3dkY1RRc0JqakxRd3BSOWVO?=
 =?utf-8?B?a1NLUGVaNEVlT0drOG1odlE2N2J3QUhlNFU3Zlp2bDU2clFDOHo5NUxnMGpm?=
 =?utf-8?B?NFMvZ2M1SW1CRkt1RXp5cEg1YzZzdW85M1BpbW1zb1JoMVRjREk4b3dRSUdu?=
 =?utf-8?B?Tk5GS2lBeUZtamVxaUdwS0tDYXVIeklsNUphNm1ubDFnMmhPRy9VRWxoK09S?=
 =?utf-8?B?WExYMzU2T2xLVDlJQ1dSdUh6U3dIRm9DQysyNDBCUG94MXdScDMvcGZ4QlhV?=
 =?utf-8?B?cWlhb3RORGI2aE84TWVmS0MrRGkvRjdUK0twc0VwN084ZXZVTUZWSUt3VTNI?=
 =?utf-8?B?aUNZbnM4UW54QmZGL0lhQXN6N0VIVVZBOXJXanVDR0R5citqOUNFeDBKU0FT?=
 =?utf-8?B?WUp3NUFHTWhGa3FiTkNpOXdnbEliL1ZzYUFkZUFaUXNPaFpmSlJqOUVqV0Zm?=
 =?utf-8?B?RU5qS05VUGlOSURvb0ZUTTg3UDhYblhPZDUvMjNDdHZOb3Z1ZEZwWk4vWGdI?=
 =?utf-8?B?R1Z4czRZajZzblFxU1liWUxlcW1oekVHT2ZaZ2R2ZCs5RzdkVHV4U3l6MXdz?=
 =?utf-8?B?ZUtFSjlsaUhVYzFYR3I5RVRqMW52b3FHcS9yZkthcUVSaERwaWhLckZDQVZy?=
 =?utf-8?B?NmVIN1RtOXY4UG5jM0F1NzBqaW83NXY1Y3o0WUdSSXFyOHo5T0hmMFFwU1Js?=
 =?utf-8?B?YXZVVCtJNEhwclNpL09SKzg2OU5pM3hBV2hPME9ZVUpWZzM3NXF1VWNDYzg3?=
 =?utf-8?B?bTJJSVJOaGVtaDdDczFibjM5SjZWVS91Mk1HSTRlbWpNWGdDOXFpVWRSSTcx?=
 =?utf-8?B?MG41SHFIV3pKV0hjMEJ1d1RxWm9mT1h0a0dENVRCeXlyZ1N0Z0xHNWN0aHQw?=
 =?utf-8?B?bDQ1OWkrVmlwNUFzTWdNR1YwNjF2YXdOZFdaa1MrMkliZGR5eGtjY01yQTdX?=
 =?utf-8?B?ZkFtWGZvaG1YYVRvVGZpZms3RDlvRHIvQzZ1S2wrcmt5VnZ3bmJjTDVlWmtU?=
 =?utf-8?B?QnYvKzBycklmZ0RzRlZYTzRYV3dId084dndmUnAyazlqaTlNbmRRRXZYTXly?=
 =?utf-8?B?bFE5UUlZdm02bzB5YlBqKzRHSFcwMm84WDFBcXpSSFhwcGovaDZ5bkQ3UjZB?=
 =?utf-8?B?WnRiRlFIdnN4ZkhmT2pNcGl1NmtVQVpzNVFDZEpTdVoxVzRnblpFQ0dYVTZ2?=
 =?utf-8?B?cTlOaGErOVN6Q1RVUnFaN0FrY0J1OGF1eGIxY1pDVUZNVXRZaTd2akp1YlRh?=
 =?utf-8?B?SlE1cGZMcjVRL01zSDZHLzMzWlRZeXhwS2Zkb0tqSXMwRDZxTjBFU2pHM010?=
 =?utf-8?B?K291MXNJZXZna0ErRXk3SFFuMXZ6ZEtqOUxEZ2drbmg1Q3FtUjYxazV4SlI3?=
 =?utf-8?B?Nk5lSVBYSUxuUkJ5QjgvQzhWcWdKTHhtbHpESzd1WjBVR09RcUVoQWw3bWg4?=
 =?utf-8?B?OUEzQ3RKeHRMZldWKytndz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bUFhQlFkM3JMdFpWb2EvVGFJU3RBMUVKamNUOXFDTzkrMUZDdWNNRXlkKzZD?=
 =?utf-8?B?cU90bmQ1VjJNQnl4REFBekpFNnJ1ZTVkekw1akY4Q282YW14TllDcWtIb1VZ?=
 =?utf-8?B?RGhJTmV5UTI2QVdGaDZkVGV1amJuYmlyUjRpODROZ212S09ILzdjenp2TDlx?=
 =?utf-8?B?dTZuL290dUJkR1FGRW0vclNnUmRIMU5ndUUyZUtYM0pwSmlrODRpTkpOdDFV?=
 =?utf-8?B?MzBXQnNHQ0s5ZUZtQUFMMDZYWGwwTU82U0hRY1ljSEsycjJUU2s3Vk1jU252?=
 =?utf-8?B?NU0ycktLWklVTStkRmFmdGlLbWU0enpFRkp6VWt6aXMvSzY1SHBRRFhiQURG?=
 =?utf-8?B?VzdLT0hVY1ZZazBNTzJxUDBVSjdpRjhCUmpxMjdURGs1RTBDN2U1S3FFai9Z?=
 =?utf-8?B?aURJSlRaV3dpZEQ0THZMcjNkMDdOMHJRU1QxZFpGNUpORVVtcHAyQjhPTTNz?=
 =?utf-8?B?ZEt0SFRaQVdCMnozRjhDYVpxL1NBaTYySmd4eWZPVTRhU2dFcnN0ek0wZHpG?=
 =?utf-8?B?ZXFiVStnSEJ1UVRpaFVtdkpLVWwrZFVjTm1aU1EvVEVaSUNJOW9XbGlPWHJ0?=
 =?utf-8?B?RVVzWGQ2dWFjbzd3a2pFUVNLcGVQOU04TFcvalo5SkhLRmU4NDhpM1RvelNt?=
 =?utf-8?B?VjFOVVdTcExIa2JHcmpEcVBTZWhaOGNDRWlIcnI2U29XM2c1ZldMdDk5YmZ0?=
 =?utf-8?B?SURmdGh3WFduM1pXdk9TRG1NYTFuYmZ2K0xkekFiQzB6bkdsZTdkRVM4MGdy?=
 =?utf-8?B?M00xQUVNMEEzN3pqd3lRVnl0YmJzSjN3Q3pUUGxtRVpTUVpBZUo3Y1phRGhW?=
 =?utf-8?B?ckVsWHBReVF4U1g4aC9wdGNoTHVhU2xjQ1Fpdmx2V1RNQXVNSE9JaEtJYkpE?=
 =?utf-8?B?RHg0WnlGeC9GbTVPTVRiLzduM0xPZm02L0VRTW1DWVBOakxFVktNbThjZDBV?=
 =?utf-8?B?MFNqd2c0T2ZrMXhtU0xBdzJLRGxBRkZBS0tUSmhZZVo4Ykd2aTdnTXJsaUhQ?=
 =?utf-8?B?TGYyRldPK1ZnVk5jbmllZzB1aUduWWh5WVdRek8weFZCR3ZleVRkaFR3MnN0?=
 =?utf-8?B?TTRTVU9TME15MG1RYU5Zekc3NkRINk1OMkFJWmdia0czbzRtRXBnMCtLQXYw?=
 =?utf-8?B?MklLYUpHZkpzNldJSlozNTJiRHZzMWRHYXp5VHRUTnNjeldDdnRLU01FV3ZF?=
 =?utf-8?B?U3hLYnhoZm9wVHc0czZuanJJMzdGU3g4V0NRbHFBMUNFbmJ4SUk3RE9MQ2Y5?=
 =?utf-8?B?L0xNUmpINlZ4ZjBXNnRpS2Y0bUVCMGE4NUdZYjNoWnZRMzEzOGg4cDhNb0VM?=
 =?utf-8?B?bTEycExjcU5ERUpXTFVlMUNHcFkxMVEyQjJ1V1A4NXppcjVpZktuQVFYTlFL?=
 =?utf-8?B?Ti9mbm90Vk1jczRmcXZZRXBrUTJUUzd2cG5rOXZUN1lCRUlpSHZpZjJYU293?=
 =?utf-8?B?LzJjTG15UnhEZllDRStBeDVobTM2YUlmd0RNeXlRWjhIZEgrYjRRN2Z4OENH?=
 =?utf-8?B?SGdZUTlvRFlaZ0VMSnRxNzlxdjE0Z1c3d253TGZtMGlBNERKbWJ6VmQrSkd1?=
 =?utf-8?B?QXRIZFRHOWM1YjFTcXRKL3BOOHI4dldtcTdhY2I4eU9wc3E0d0lRa2ZyU3BI?=
 =?utf-8?B?a25yb2kyVHZDNzFha2YwYXJDV21nQUlXTFRZeW1jSjhydUhBTHJiNGcxUkFq?=
 =?utf-8?B?K2ZIc1p4cGFIUHRYbHFXTHc4NExrNDdDTkVMS2hQL1ZTc2p0NnFKSnRRODlY?=
 =?utf-8?B?RTN5eUJuejFibHlrKzlTV0oyOFpWdzdKNEs1L0RTb05KUjB3VEhjaGk1RVdX?=
 =?utf-8?B?WEV1K0lvWVFKblZ6Z3VCUkh4eGE3T0xuVXJRa094bnZJdmFVek94U2ZrT2E4?=
 =?utf-8?B?QXAva05Ha1JrUlorUllXT0VFSkduaDlDTVpGUURHSllEU0JpMmFpNnlIVmhP?=
 =?utf-8?B?eXJCLzJsWlBJekhkMWRxSkhmb2Npdm1vMjRnZ28wSGhYbU9wYkNhdGhVQTJO?=
 =?utf-8?B?bW5NSHdrMklBdW95eEI3aTRyOWsxZlltUXZnM1UwK2NMaXByM3NXanF1dkZW?=
 =?utf-8?B?S3RwMjhjNmZPbkV5MVhBVGFQZFlWY0dMcE5jMi9TUTB2MnBIK1E3T0hMVUUw?=
 =?utf-8?B?eU1XZ3FmZUhoamRQdE81Smltb0pjOHJLVVErRUhiVjNLZ3pqeTN1b2U4VWxz?=
 =?utf-8?Q?nA0MXivUYX1SbponDzpXMLE=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c93185d-2562-44ff-bb3a-08dd3557d497
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:29:10.2864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jZpVeYc5US/urf9ZxptWFDSHDIblCn1nMPce1yjGNsibsxQGLTV03FMACIudGkkXJYoxrjgCaXOuPkJYTAYYGD+l1JUCdt73tdVk4rMTvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6882
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jan 2025 11:29:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6115

Hi Adrian,

On 1/14/25 9:07 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
> From: Adrian Freihofer <adrian.freihofer@gmail.com>
> 
> Covers the changes introduced by commit
> https://git.yoctoproject.org/poky/commit/?id=efa5f65c2214239ed7aaf7bd8998683e755c5660
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   .../migration-guides/migration-5.2.rst        | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> index cb70e19da0c..c317587ee5a 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -74,6 +74,26 @@ systemd changes
>      As a consequence, the ``systemd`` recipe no longer contains the ``usrmerge``
>      :term:`PACKAGECONFIG` option as it is now implied by default.
>   
> +-  ``systemd.bbclass``: If a ``systemd`` service file had referred to other service
> +   files by starting them via
> +   `Also <https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Also=>`__,
> +   the other service files were automatically added to the :term:`FILES` variable of
> +   the same package. Example:
> +
> +   a.service contains::
> +
> +      [Install]
> +      Also=b.service
> +
> +   If ``a.service`` is packaged in package ``A``, ``b.service`` is automatically
> +   packaged into package ``A`` as well. This happens even if ``b.service`` is
> +   explicitly added to package ``B`` using :term:`FILES` and
> +   :term:`SYSTEMD_SERVICE` variables.
 > +   This prevents such services from being packaged into different 
packages.

I believe there's some misleading use of the present tense?

This behavior is fixed no?

So I would suggest the following:

"""
If ``a.service`` is packaged in package ``A``, ``b.service`` was 
automatically
packaged into package ``A`` as well. This happened even if ``b.service`` was
explicitly added to package ``B`` using :term:`FILES` and
:term:`SYSTEMD_SERVICE` variables.
This prevented such services from being packaged into different packages.
"""

Does this make sense?

Cheers,
Quentin

