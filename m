Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86ADEC3ABCC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 13:59:52 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.67])
 by mx.groups.io with SMTP id smtpd.web11.77240.1747144785207705989
 for <docs@lists.yoctoproject.org>;
 Tue, 13 May 2025 06:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=VQl/kWQM;
 spf=pass (domain: cherry.de, ip: 40.107.21.67, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGBPf7nEoMV7LUdyLV7X9Jrk2OrNS5+yufMSQuqhuXAMqrrIqC9HlBvGhf2iw455FgsTfpGeS9dTNtrrlnKkpDQkCSjB/EOiIO7pWg9pw+cMd+MPB+rvzwpuwMmWYhdXlXZKeSQhuOVNgKA6dJ57Zt7ZQp3bATHycMkeD4cAN1MMKrSeF9E+e1LJkhoZMO1GJWvUOiOnLYgT5GJjCtXMpr2rvifTNRz2w3mUVR8YCNqmDO6mn6SoOoDcmXLjfxbRyGd2rugazNJSr0rYCrFNlWyzF4v34CAKBkewvpBotYxjhTUWd8wyqCStjSMc1s1P3T7+QFX6mtsVnkTpzwKgVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTwlDnSbXUdlU35X8KeMV7XhtOgLrqJC9/GPnpHOraQ=;
 b=GFUM82/F4JbOtqZuhEnB6pWqySs7YcrgNulNIcipTcXeBz/SRQi4SRaLWKQxzjppgYDp9izIrWjqgYFnnMIa792Coue30xyAPqtBSTQbpei+Z0rDnuEjapm52T/JdKAy1ci6VvhDAlvyuZcQYnQhnrKgWjIMpIsePtt9Jjy1LLMHV3a2fzoVzMmHT3sQ3DvQQs2noLOuoWNkCkjFXyC2Xsn2HZQSGW0cWfARl4ooNNSm7rLE56hBwwzQLhvNwJYYCjn2I8E85SK2RdAH6ZZYDZsIxpiRF2TpYcWqflmh+GIS2UTBFT8AuJ53WaC4XgIjYIdVjIGFmU0wRxgYeO+HzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTwlDnSbXUdlU35X8KeMV7XhtOgLrqJC9/GPnpHOraQ=;
 b=VQl/kWQMSCmJ0HQW/n6mRGzIleQsmSGDiN1kwg1Jq3JPc8y+MXMdcA3VN/+uEvH3FfkkILewsCf0Lux1/uNmL+dhvJ3cQ1CKbqwZWv6s2uHy93wbp5ze+cFV2yIG804p3W6ZGKWgQoEwg2XOpMn1H0WYXEtZKTO8u9bSPrT16RU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10428.eurprd04.prod.outlook.com (2603:10a6:150:1d4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 13:59:39 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 13:59:39 +0000
Message-ID: <5279eaf0-8cda-47b2-b829-aeba5d907a70@cherry.de>
Date: Tue, 13 May 2025 15:59:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: document
 WIC_CREATE_EXTRA_ARGS
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20250513135345.38651-1-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250513135345.38651-1-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10428:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e17f12-62fe-4944-c4cd-08dd92266717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b2xFaWk1VkVIT0FmalJHS1h3MVVVUjhORTJ5K1JQcE1rdUlWcFFPUU9iVUto?=
 =?utf-8?B?MGsvRlZDM3c2RVp1cmEvb1FsNi80WTJJUDFCRmhDZG5hNG9ZN08rRGFrNlhF?=
 =?utf-8?B?MFhrbW5tVFRFWHlWd2dHa3loaFBlZWV4eG9FdjRHWVBVYXJ3d1d1b3JMcGZC?=
 =?utf-8?B?bWtIN1JLakJpR2NQbE1Xbm1YY0F5WllXdlRsOGlaSlk3R1VTOC9HQW5EZk01?=
 =?utf-8?B?VElQN0dCNFZuWXBiWHNDblJmSFFnaG9hazFpbmxmcjRxVlB4akpnMGlCYyti?=
 =?utf-8?B?Wi9ZNjRQdUpDNm92VDh0QmRzbVpJU21rL1lXRkMxcGV2UFNCYm0yZlFWaVl6?=
 =?utf-8?B?SmxkU3lTK0tGZzFOUDNycTMrWjJGNU9FeWpBb09NbUhzaUpubTRUWEw5UEdv?=
 =?utf-8?B?Z0srbnlod213c1VPcDRJTkhqdFhQYUlKemowaEV2L1VpRklnZi9DdkVJMGVX?=
 =?utf-8?B?SHF4bmhudkxhQzFPQ1IxRjBaWk0vcWZ0MWtaY2F2ZjdFYUZWWVZqNDlKbW5Y?=
 =?utf-8?B?c1ovcG1YTmYzZDhoWUlIOGdncXNHNkxXZ3ppVVQweU94TDNSUWhSaHNGeW14?=
 =?utf-8?B?VWJXTEM1YUo4b3gya3U0QzRlSDBEN01yU01LU1lDNFZPUi9PMGRpM2dSanpH?=
 =?utf-8?B?RFRpY2ZYUE1DRG5VOTRhb3dhV1oxaGdKVHBQclg2UDFFK1I4YUJQYVRxdTlG?=
 =?utf-8?B?Tk4yWGtMTWt5aTBJdGlOa0x2ZVJjQzFFM25jZlcrT2N6SThoeHBsSEJ0NWJ6?=
 =?utf-8?B?aExtOUlQUzExWHRTUWtSVnlCZ1M5Ymp1NWtmbDNRUzB6QVB3eG44QTBJOGlY?=
 =?utf-8?B?OEV6Y29kaGs5d0toZTAzc29oalNhaS9ybDNxMlFXRzlvdkZGVU0zcDRraGRK?=
 =?utf-8?B?Z1JkZ2dCNG9FbG53RE8wRzNMbzJKY0d2TUYyaXRhZlNzWDI0UlEzMEFVNDJu?=
 =?utf-8?B?V2JySEZ5RUlldC92endzc0FKdnQvcjloWUNNTWFuaThTVUJFblVOTit6NGNU?=
 =?utf-8?B?YjcrQlQwRkhZamU0SVc5QjAzcjRZMkROREloektkT1pnOURBb2ZyRWF5MUo1?=
 =?utf-8?B?TmNVYm45SGF0Ri9QNjczZXZsSkJlTDZWdFhRWGFLWVVhb0dUNUZMYlBTNVpr?=
 =?utf-8?B?T3Fta0NCMW1oQ3ZMWXdiWHZ4NksydXJYTktzTCtST3FyT2FKdHZaSnh2bm1V?=
 =?utf-8?B?OXJ0ZnorOCt5MHZySURPb0JzU1dzSE90Q2tkOHYySjVvNUxnd0tNdkh2eFdN?=
 =?utf-8?B?bHpNZXU3NzRxTnlXZG9nQWNzRFF2eHA2YjdkczRENkJiZUEwd2xsMEhhd0VS?=
 =?utf-8?B?TEx0RFJDNTVZbjVNam13djdwcU9VWXllRnJsQjFoc2JVckU0dGZKaUpFM09r?=
 =?utf-8?B?ditNSldHV29sbDJlY3A1UEhqaWpzOXJqN2N1UldrSHovREM0bHk4ZEZ5d1JS?=
 =?utf-8?B?c1ZqYkV5VnoyYXowZzc4UEdXUW8vZXkyK2xJTnNsTWt3NnNDdzV1UzkrMGYw?=
 =?utf-8?B?OC9MSlNKaWxzOTBQSlowOEk2cE1WWnozMDFMWjltWkVsYXltSGpUN0lIdllx?=
 =?utf-8?B?U0pFYWVDZmFLRWxwTk9pdC9hOFZhMnBqek1PNFhQN0N0ZTdoL3oxY21NNUxJ?=
 =?utf-8?B?aE9tNDNxZnNrcTh2SkZjZTkzMDJkUWNRMUVpeVlyS0o0eERCTTRMSmRmZGZD?=
 =?utf-8?B?bmh4S2tvMlRFNDhWbDVpeUVaTG5hUGlFejZKbVd6b3VMVENwS01MZE9wZjVH?=
 =?utf-8?B?VkxDckRwOWFtN25kdFRhdFQ3N2RVWGlRdUV3U1pHdVF6QTRtZ3JYdHRhRlYw?=
 =?utf-8?B?cWthNThHeGxwQjNoQmNTdWpxa1lXcDVpSy9HNWNBQWJ6VnFCUnNWdlNLb1Rh?=
 =?utf-8?B?c0VNUEZqRmlIYnNGK3dkWERueldleElGdVNoZktSdWNJdi9iMFc4bXhmNjcw?=
 =?utf-8?Q?2eEN/K/PX2g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UTRYSkdTZitBakZFdmNFemtFc2Rtamo2SE9QZTl1eEszMFVTb0RkZ3dMQTVT?=
 =?utf-8?B?dGtNS0pDMWdTYnF2a0YvN1lFdDdib1ZRcjNTenlwMDBqRTBxZjkrSW5CaVRj?=
 =?utf-8?B?RVB3SmxqVjZUemh3eVpZYXJtWGxDbDAzT00xaFBNUHlnUEZqaTZoRUhQMERQ?=
 =?utf-8?B?ejkvYmVYanZlVmd4WGhwRDcxbVk1YlFSTlFwcyttQzNjM0JpaGNEY0NsWkpq?=
 =?utf-8?B?Mk02WWtRUm02KzdSdW1BYkpoYnlOeVkvbWp4bDd0cndsbnFxTXNtYVIzRFRp?=
 =?utf-8?B?dWVLYTZuQy81ck9wZ2QzeVE4MnkrMkRXRXJUOXh5eHhzUFI3WjhTcTdvLzQx?=
 =?utf-8?B?Z1hmUTZ4SXBPZDhVMjZhNFJjSllxRVQ4cXpyblFaU29tcDJUSW8ycVVxWWlH?=
 =?utf-8?B?TWVRa213WGtyTThudXlnVm53VC9CN2RUM09ySEMxaVhmaDBzQXArSURiN2Jm?=
 =?utf-8?B?cDVKT2ZROVhLaDlZSUxPRXY4N3RsdEl3RU81bVJzeEhxSnBVSjFaRm5kemFM?=
 =?utf-8?B?eDZrK2djSXNwQ1o4U01ZZUdicnJQc1grbzE5dy84UlJGTHprcUxQeVhQY3V6?=
 =?utf-8?B?ZS9tQUdldE5sMDZNZ1hDQUZrTE5sbWwyRS9TM01zVDUyRGFlekZkV2lIMVpC?=
 =?utf-8?B?WGdDRWhHeXJldE5FbnRrT2U2RFJTSFNUWExXODRWdE10TlRoUVdLTFF5dW9u?=
 =?utf-8?B?TDQvcHlPWGVYRGEwdEJCY0twUUZQOVpacFJFMTg3ZUxWQmFLaVdMR0FkTzhI?=
 =?utf-8?B?eFk1R2owMEhxMVE0MDVEVmlZdjhMWmNEMFpUUXJ1aGo0UlpTN041THZMY1VG?=
 =?utf-8?B?RDBIU1AwVGJIZDBQcElZcDQ1OFBlR2NuMVBiODdzUTNqMklISzhvb1dMSkln?=
 =?utf-8?B?aFFTRjdOdm1KbFB1VTBNSlNKTVA4WTZucUUyYlhGMmVQNG5jSXdoYXJSZkY4?=
 =?utf-8?B?MWZKbmNUMmpJWk9DUEtXMUVDdmFuNlpQQlR1Q3J6M25ML3BpcEU0TmxrQ3RD?=
 =?utf-8?B?S04wQmVFMkNnaTgxd1pkb2JBMjVCK2puQytFVHdaRTA2SnBjYjE1V0grQXpu?=
 =?utf-8?B?ZHdTaXRxd2VoVFlDSW42NmJ6YUJub213SmpMVXVESnpZNnFqUm8xb1h5d0JZ?=
 =?utf-8?B?Y2U4a2NGZHNpay9Zd0prZU1pQlZKTFFtaHlEL21zVG1RZXJDZ0RTU0lranJL?=
 =?utf-8?B?S2U5TnBTN3lKNW1aK3NIbTZ4UGFmMHFac203d09ObVFLNDdQWnVjTmVKWlNM?=
 =?utf-8?B?d2krSnBYVXMxSHdsa2FVSmp1UTk1YlJ6MUdxOXJqY1pKa05EdytsVVZHQmZH?=
 =?utf-8?B?NzQyQXZoRVN2VEIzKzVqYTBBUkpudzZrbjhhUlhhZXVJVVgzMVhsLzhiaHc0?=
 =?utf-8?B?UU05cUxBYm52ZnRnWVRYemdyMDk4VDJBdndIK1d0enA1aWo3QUFlRTNYQ2JJ?=
 =?utf-8?B?OUhud25RazBrcnU1NlhGMkZjMWkvMUNmQnpxUjdQREdQVDArSjIzcjFYYktB?=
 =?utf-8?B?MU9EQTc2dnZDRWRsb0dYbFNzdkdkdlFRenIvM2xFdjlncnZLNWZmZkNLMnAw?=
 =?utf-8?B?K25XREE0SUZEUkU3bTJYRXhXY242eVdDUnhjR0lSZEhNSGsxNmYvTHp0Kzlv?=
 =?utf-8?B?SUJvMndYekNONjRMelNpRzYzYSt2Yk9ZZi9xaWh3T3hJT1JxRGJjTm9TaXNH?=
 =?utf-8?B?Z2FIUHBLQ1E1WkxtTy9mRTdkeFFlZFBkQzdlNHhBR1BpNEdncGtoZWN5SFRP?=
 =?utf-8?B?TFo0Y0hjTGV1cDBIS2hublpTazFDZzk5b28vT3d2UnVrRDhGQUpONGh0MXFh?=
 =?utf-8?B?WWs3SUJIcUJhRzFXdUx4emZJOXJqUVBlSzltclFiRXdXSk5mUSsrekZDNytr?=
 =?utf-8?B?eXBkeEpGOGtYTkpwK3RkUjRhNVVCSStSakJ1bm0yTmJOVnF2ejR1QXBFTUZy?=
 =?utf-8?B?ZjI2Uk5acFh5ZFF2dld6NEFOejhUcmVmeVRlVkRHVGdBQTZoMWhNWVNMM0JL?=
 =?utf-8?B?UmVKdUh0SC9JUWgrM2RhMU1yRTlNK0ZoYjZqTzJ6TUY4SitPVlZseWRGVkkx?=
 =?utf-8?B?T05xV3pqTUEwcHRGMmtyR1ZrS0NyaHA3dTQ2WnJpR2JwNi9wZHp0azRjV3gx?=
 =?utf-8?B?NWxVY2FrMk1SWi9yQ2xjcERpUmRzUmNLaS9VMVBicWlRRERLem1maWtodmtR?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e17f12-62fe-4944-c4cd-08dd92266717
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 13:59:39.4163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R51WCst1JkMSxxkFolrYEsMMeWSo9ssIAJcoJhpGlxl6ujPlP4qn7P3hyr+D96euS0UN5WVhZcb/UFnHFo1OViHPSz8jB8rQ+sxOVb3RWPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10428
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 May 2025 13:59:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6820

Hi Trevor,

On 5/13/25 3:53 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> Fixes [YOCTO #15509]
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v2:
> - link the phrase "Wic image" to the dev manual's section on creating wic
>    images instead of providing a paragraph at the end to include the link
> - remove any reference to a bbclass
> - reduce the number of "`wic create`" phrases
> ---
>   documentation/ref-manual/variables.rst | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index d17f81036b7d..1ba687820131 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10942,6 +10942,20 @@ system and gives an overview of their function and contents.
>         Specifies the timeout in seconds used by the ``watchdog-config`` recipe
>         and also by ``systemd`` during reboot. The default is 60 seconds.
>   
> +   :term:`WIC_CREATE_EXTRA_ARGS`
> +      If the :term:`IMAGE_FSTYPES` variable contains "wic", the build
> +      will generate a
> +      :ref:`Wic image <dev-manual/wic:creating partitioned images using wic>`
> +      automatically when BitBake builds an image recipe. As part of this
> +      process BitBake will invoke the "`wic create`" command.
> +      The `WIC_CREATE_EXTRA_ARGS` variable is placed at the end of this

:term:`WIC_CREATE_EXTRA_ARGS`

> +      command which allows the user to supply additional arguments.
> +
> +      One such useful purpose for this mechanism is to add the -D (or
> +      --debug) argument to the "`wic create`" command. This increases the

I would tickquote -D and --debug here.

Looks good to me otherwise:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

