Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB33CDB46B
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 15:29:56 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45004.1781882986541487188
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 08:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SLdzbuDI;
 spf=pass (domain: cherry.de, ip: 52.101.84.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGG3iXCpgNszBRDbIiZ8G2WAFpGvQIshfk5qUeKNxgjxH9MHPhXVX+AIqCoZYijIkVn+C3l7bztpb/oOX//nH3LDeYutXt+2WNAameTKhPvBTMPnZMAd54p1bnfKQfF1CveUoX9VLaFAtTnjsx+MzNhkop+Azmx8Mq5OG7o/x0DF26X4H3j3PgQ7JSt2FS6lNGHWPkwEuCQnI8fk/ZItoAv+DJ6DsULnX4dd68pRWiKuNMgUHNwYY9u3QYJINnpolfyDmZkp9N70ZsCdBQrC/HDnbQxPP9jpe6yn/GWclPAhYgujhZZ0muaT/WSAN6AZgDbyj+HQyD+t8cJQO5P4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07mKNkr2UC+2OckNdvTlXfIFaJaILYQ5PHGkD2uB0EI=;
 b=htGqipa3U+Z3e+3Ct4uvOExMsCv3xVgmTzmpcDa8mrALc3N1EycNMMyZRPdqniVcg8ixCjnK6W5qOqN4Y70RwhJ57iMHdkZ2kDRH9B8Vw/R/n2dAsXdnD+kCn0QJxelhAFBhKR78TXOG3ErDeCgdytGtQPhwGxs7F1ww29OuKaaiTq4XPxYSbvOddOYSPV/mbpuLpwA6D2xiT+vCqocWWh1BE0hRMtJWENSXJ1HYy7jCqIk0OyibjYKlSEfpdO+zP6V3sbHyu+Ayoyi7C37xENHzK8Q0a97LlIZLfhGPMnwgM9+9cBOPjlxKja90GdPRzZOz8xAozSFK9edXVUDbnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07mKNkr2UC+2OckNdvTlXfIFaJaILYQ5PHGkD2uB0EI=;
 b=SLdzbuDIMkE688mDdWONXnFR9q2USwBRYCLvh0d/e0qIjbUtU23HeIZz0yftUu0nx1MXTvDm+Et9nQzOgBmXBMVLFE/mDj8GTARoTgkB4oC2o3VE2JIF2PWqpO5FTnVugLhptwZD/XrLcK3V/Xf2+d0ShqqCQMc5ownwa48WcU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by AS1PR04MB9285.eurprd04.prod.outlook.com (2603:10a6:20b:4df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Fri, 19 Jun
 2026 15:29:43 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 15:29:43 +0000
Message-ID: <0f0009a4-b6f7-454d-87a0-4a61d084b55a@cherry.de>
Date: Fri, 19 Jun 2026 17:29:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] kernel-dev: remove references to defunct LTSI
 project
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <df04bcaa-3360-c4d3-6305-8a5650d4209e@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <df04bcaa-3360-c4d3-6305-8a5650d4209e@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0122.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:350::8) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|AS1PR04MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 680c638a-839a-4602-c6ae-08dece17966a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: 
	QgZFPKmvDu8QxTaiI9rdEaU4y7SE3K8S2fUHgKWHLnLBU2lkIOwiCCJlHmgoC7pG7lQ8bDuWM+LFR3CyootNF/kNs2d/m9Gzm99h3Sr33u6LqYpNTSi2EfmKGCN4v6HWnX5eV4B54TLDfj2PazlBChrlWXwtcqIocI3z0EYmOEPIXnH+sRddzLSJQhRO4sva+Ncpwy1Em5rBWsZ0diAfPzJDGr4kA8UWj68NAU09i33Wu6Fukt0zWtMobFBMO0hTQVK9EoCx3M4psxbaW7Gi7NMmrRZfjNQysl6TvgGNtymbjKiLf5Mq3WKvr80lNr/tZc25mwkDQpoWHm8y6ykqN3TJCD8Wa8wWodCPcsxKwST7Oh8EGaPOI7PSbgi22D3jH7iCJHivdYTfAXvGz1h45nUFkcRtwOJtEH/fMnV4jDbYvPXtTfkAyegWo0LaVQPFOzpQNqZGinhmxuJoxD62AWCF3ed9SkrrLBBlUEvmURgGFXfnm5tn532f6sTVMK99dAHk+VY2GXvk5H4wZwYllZe7Zcwsi2N3EvBIQ+pRQHDLc60M3qXrZDJOiP+j7aeDxB7gPS+2JFJMcCpcEI+VVBbOAT4b++fV00v9x29f8Y6H6XQFMPYfkqK9V0wuqZIR/8H9AXi0X1dJOVCBFTcpVk5FJMBvHsQYR9K9hpQzChA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SUo0QkdMTWpiSHM5a050TnlhT1ZWaUJYblJheXJWcW52UEoxdWJJMktmRDFH?=
 =?utf-8?B?czJuUDNCK3Zhd0JtbFliV2c3MEZTcml6QWJkYW1lWHR2N3dHZS9QamY4RjBa?=
 =?utf-8?B?VmZjWmZlOGRERGRMU2t6L1NSYjBQNnUyZHFvUno2cHQ3SVIyN1I0MWdERHll?=
 =?utf-8?B?MTdZL0g3TWgyZmJUd2xFT1doeEZTTzJzK1NQRWlPcHlabnhpamxOSmNUUlJ3?=
 =?utf-8?B?ejVVZnBoRGJkR0ovRWhFRDRjQThyaHV6Um1UTUx1ZGxlN1ZqWFJXZDFpUnRj?=
 =?utf-8?B?QWhNN0V4UWRVVDNPRG1veE9RczA2TDdwRlRlNGtzN1dtVG1rYzJrZGJ2aVZv?=
 =?utf-8?B?M01HOVk5cDhzMWc3MUdsOVZaVll3ZTFjRU0yZnZhTEJTNGpKcFA2dy9qQ1RC?=
 =?utf-8?B?Yk1RRkQ5QnRFb0l5OVZBa0hKSFM3TldpZy8zejh4OFdBYW54MThEeXdBTWtR?=
 =?utf-8?B?c2tualNrc0pXbGZXYTBVT29yeHRkckJmNUdJeGo2Sk4vWldNK3RjSXc1dmZr?=
 =?utf-8?B?VzhGd29RbEdaaWoreis1VTBxeVJveDFTMHQ2VXlha25WUWtoQmllMzZSNnpJ?=
 =?utf-8?B?VkJham5zSklhVXc1SllFSzJlQW8wNEcySFFnU0RhNXBjaG9zUjRFV281WGll?=
 =?utf-8?B?cEZZZ2VjMHllVHd2SW9Zc3pESXEwQUU2czRIZWtuTWpkZXpxQjJxVFNpRGNs?=
 =?utf-8?B?TEExQXpKV3ROSUIvbWFjUmFoWmlPQTF1dlkvVExsTEQ4ejVZUFZBUHUrR2Va?=
 =?utf-8?B?M0hHV0FaMFhiOGFMRUhDdmZHeFBrK1I4anhjUGxoMFJsSktOTHRXNTFBUmxi?=
 =?utf-8?B?OFpPSTlEOWM1L1JsajBpbnE0aVJYbWxacXdwZkN0Y2lESHFPNFIwT3RTZXp3?=
 =?utf-8?B?UDBNYmVwZGlDeXV3aU1UOGZYU3pkQVRZZ3h0SVdvaGg5T053YW82ODgrTWNr?=
 =?utf-8?B?TlNqcUVvclpYWHhscHIweVpYOVM5b2wwcGhkV29SZkRZVFhGNXNUU2lJMU8z?=
 =?utf-8?B?SmZjQ2JoT0t5L2h4U3l3N2V2aFJNcjdvZFZQVytYV0k4VFdYRFB2U3VFNkFY?=
 =?utf-8?B?Rk51QmQ4ejdNMnBmNDAxTHdONzM2WGNrb05TNVU2cngveXd0RlFuWTV6L3dG?=
 =?utf-8?B?SnhmTDRqUFNBckJCcldRUmlSTUNNQkRiaHRkbytXZE1VUXVIZXRFVE4rOWVm?=
 =?utf-8?B?NFJxb2U0R281dEhsS1hDSmlHMm9oRjI0Y3ZBU3NWeUJycDgxcHAzREJ4SlVu?=
 =?utf-8?B?MUNEbzJHbDVNaFpzekFYTnRJakFBdXBhQUg4RXZXaUVvNjBhdWNQTUZzRVlh?=
 =?utf-8?B?SVFMZnlidnFIM1pFakVnUGVTQThqc2lnZkEzVVZRNktPQnRDenR5c3dQTk9u?=
 =?utf-8?B?dWhqekR1WnZRZEtDZ3F2Y1NNUlFha0VQY2o1ZG5qdVVkdFhwOWZsQ295dUlX?=
 =?utf-8?B?bVJkWjhZVmFZM28zNzA4a3BWbnlXaDIyc29WK05Bb0xreTQrWVFERndYaTZU?=
 =?utf-8?B?YzlxZzNFVUNpNXRGZ2cxWmJiQWlqeEhwSlhUN2xZR3ZGVDF4QzlGdWVpVUtz?=
 =?utf-8?B?dGNnMUJoblNva1RFRHdzQnl2U1RadXY0a245ZUVTR09zOWZzN1N0bmpuU1Jw?=
 =?utf-8?B?d2c0SngyaWl4eVNDdUhjL0VtR0VrMzBIb3FXVUFNSTJCdDBMRGtvaG9aMTJn?=
 =?utf-8?B?NWtPaXV1RVRUdzJxaDZuWUd5bDNCNGFqNVYvYXBvN0R4c1FacjVlRHdXTUtQ?=
 =?utf-8?B?cjF0RnZrTjcxalduckdmSE1DRWgzUWVNbmw1MG0rWWVEREt4QXA5aFhxL21n?=
 =?utf-8?B?NFRiRWxDWFhuditJYTd3L0tUNkdWR1o4WWN1TzJ0MkVaZUhQQXhWOGtYNzVS?=
 =?utf-8?B?dWtHS1FydkRKdEptcUdDVEtwTTNoVDdiUmkweURoT0tnUEM1Qm9xbGdGdHBY?=
 =?utf-8?B?d1dKbUtleHhvc25FTXNwNlo1d1pYUFNJcjErUWpBcmwzcEhOWTkzK0JHNWxY?=
 =?utf-8?B?cFJ1U1lkd1d3eklHT2FCdVlqRkdNSXIzSHkrZVVhdC9YNE1EVHloWnNQalhY?=
 =?utf-8?B?QTlGdnpmZzllZVFFWDFoWUowcUYrOVllQi8vMzEzK1lWQkhaZ01DQWk3TnJH?=
 =?utf-8?B?QllsbDV1cllmbHhycTJHVFQrd25Ecm4raG11OEVDY1hMVERpL01vQU5RR21o?=
 =?utf-8?B?YjFaUWllYktvcEVhS0d6TStxVGk4YkgrUWxvVit4ZDVLUEpVNHcrSldidG1p?=
 =?utf-8?B?SnQrdnZCV0c5Y2UwZGJtOGtkSXdPeXcwTDRJWE1INUJrZWNLVmF4SGtURkpq?=
 =?utf-8?B?L0hqbksyZGlmS1FNQkJVMWRrRWNlQ2tNZjlQd1FFY3hJM0MxU0FaZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 680c638a-839a-4602-c6ae-08dece17966a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:29:43.7808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08wwHhmc7/uqfyVUTVSnhR42wFCQEfeXQ1KsSA9GnlqLagQoFwcEGxJqSnlHfKb91fDCEFrSroTUMyUirmhyXvY9OOGb6DNIY8/d13MRvoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9285
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 15:29:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9801

Hi Robert,

On 6/15/26 1:01 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> As the last kernel release under LTSI (Long-Term Support Initiative)
> was back in 2018, remove references to it.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

