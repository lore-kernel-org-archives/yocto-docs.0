Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E66CD5BB3
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 16:22:42 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20908.1779466960678673259
 for <docs@lists.yoctoproject.org>;
 Fri, 22 May 2026 09:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hcnDL7yh;
 spf=pass (domain: cherry.de, ip: 40.107.162.3, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHYct7j7RMkPGfQ4MJ7rvjHXVMGjOjBqnpgsC2Bd0fy6qc6ClkdwQ2Un1bVmXTL2T4v4A5i7pDfLI/UPv1nFOIwd9VdLj2wRXrlqKdGmdq7yqv1D3e/dlgs9v+7UeQuL9UJMxLrUiipGrA3LpaF7hibSqtp4jfd1L0fzbzVDNOEuBHEyJWA2g75JpCHTBgcQQFJtXqK2OTMwvbB5H38cAMEWcRHsmXSlUen/V1qN7ijgN9YZzmvBoFQCINuQ8rpLrcEfp3Rkc42pXSuMgrBuTy7FBlWtjej28YRD7W1EjRFbyORubsdbYIBSLaf1KJsjPiSZ32cGxkBAB8pfiNhK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aW9c3X/0cpM0SzTW8P+K6jzWN65XE+/JGd8RT1WKPzY=;
 b=g1Aje5+Rwaaf1AYjsHavR9pSNDF0CDAtH1Omz+485usPbff48cat05niKM13pF2dlu/U1S7qd3ri+6tfuo/tg7EdVk17cViL1LCBR1YexJ3CVocV4UBeK5yTJvm4Z5IeZcgeyTy/i4RnE9+FGsUn4ihrRI8gr4295AdfvM83TOAp+g0BHnE5p2j3tIQSy8GxTLOa3J+8ptaP9dZs8IhUZSqJfOuK8bNlwfxHzmnmz9P5u+mwm7SGFK1XhFYitnnwW2E413Y8Y/lGIgJdxEkcBSeA8IyBrTkvQZN+e+xLr4AGqUWKpWk0mVpE3dnb/gnI75vgJ9krFFQfLXWM6YNfKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aW9c3X/0cpM0SzTW8P+K6jzWN65XE+/JGd8RT1WKPzY=;
 b=hcnDL7yhQVhn3iPWEVQmgm+IbJtqK/EtlJDBDUrJKuSRs6LgP/y60g30bvIgJJOYJRIdzD5DaIgmncE51WA7PGdj/ISwIwEuQJuNWSzPlII5DanPdfoA2lEjiOnTZASXS0K/ceCXLzd5Lf0CNZ6nQagDttcf1o2D2cXnrctdfes=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GVXPR04MB10204.eurprd04.prod.outlook.com (2603:10a6:150:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 16:22:36 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 16:22:36 +0000
Message-ID: <128cbad7-4182-4a1b-98b0-4f9140dac0d7@cherry.de>
Date: Fri, 22 May 2026 18:22:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] ref-manual: clarify that PACKAGE_EXCLUDE
 supports DEB packaging
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <3faa7374-9428-5882-2862-861454dd0b49@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3faa7374-9428-5882-2862-861454dd0b49@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0048.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::19) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GVXPR04MB10204:EE_
X-MS-Office365-Filtering-Correlation-Id: 0870bd39-5b2c-4f72-ac03-08deb81e561b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	UwY1HVdPo5xL4HQXXGq6EBnfMyIiY2RrEa1PG2j8JcTj2glq7Fb1aL5WLHOwEoF8Ec2Ed9e+F6ahiM7MV+ZNwTBPsprgXyOQxkj9vntzK0xaa+n03oABqzTfVKoEphA4wXveTnIv13VPK6H0Vm3mi/3s5worceXyH5GVNwkqWh3IBSmltQgHy2SzkmLhpmy7k9hTdFhgZuGM7V9+NlAqSq5MIKQJDXPjID+aRalmO3or0gFa2eKTUKlcFDi1w7UUqyiV2j25uSuqdI5Fy4WXJhHEozx+FHhP/zC7Vj1PR6sMH33bc2fz1dc/YKTshNbla0RdLJYdaFJP57iiyJSLBGLq0uUKiLt7qf24SflhbusZBux+AIcmqchcTWIA0kltNWtPXZWQ5V2JkXp+KVAKy87sszRtdUtdogKxE8vMhaUFVGXbIw6Uh7hwRflelsnBsV42SmyEk1iXSJnG+916Uso+QoHXx0y78vRDzvF7pmgN+ihXWCY3oVA/aUBDKdA9WoCDeGkH+/At773ElBxjC5s7s9lY6vLf5VllV7f6AKQgQX6cXw7mhPdUi1OkU33/yiq5imHnOeWgw/O9QQwUrF8KUnyz5MQzSkU69c0rNAf362l4tHnlSyvNJdKTps9ecsOF+4kPtN9wKC8Yf0htrhPNKIZOw7vhZWFhYrN+H81sqtb3Eh5u8UWR7gzMQC9b
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bDNrS0JoZkxwaFlDNlFQTnA4eFFXZTRCeG9VenpRQ0VuMWlYMWVnakxlZGg3?=
 =?utf-8?B?a3pTZkk1RU44UHFiaGtRR2g2cnRmMWxKRFg3L29JaDZEZFQ2dXVLVXNSV1hI?=
 =?utf-8?B?QXpIQTY5eU9RSVJLM2o4aUl5Q24rMDNDT3RqNFFFaHhLVDZEZ3lBc09iQjBW?=
 =?utf-8?B?UTBEYmtibFA0YW1ZNEhlQkxEWGhXYUVCcFk1VHpObVRIUzJPeVlYT3JGQ09Z?=
 =?utf-8?B?bjRXQko1TzBFQ3RyRlRmaGVOTDc5dXBvZ3ZxSHQxZURGZWE5UmJRTm9vRkUy?=
 =?utf-8?B?dTVzMkxoTzBwNGFYSDJUTjJacWpJR0VWTFkwNisxbHptdm9HRkcvMEtybUlY?=
 =?utf-8?B?ZFlVYWo1RFJXUkl2MmVZQzRJTjdPV1lZMkUzTm5oTU1LVnUwYUFrcTRlMGRR?=
 =?utf-8?B?SVJoS0pJVjUzTHViaE00RHkvOEkySFEvMFpVaTIyQXRLRU90ZlhJVDFxNnhh?=
 =?utf-8?B?dWsydWhLR0RiSEVCWWsrd0RSVDF1MnAvbE1uUUorQU1RYUUwZE5NdUl5TURS?=
 =?utf-8?B?V1Z4dXpDcWN5Q2c5aFQ1STkvc21jMGRzR2d5dGZjQytKNUsrQ2wzeUxFWTJq?=
 =?utf-8?B?MWd6c3JnK2IrOWZVQnVrdXZ6Nm9rYnp1ZHNqWEdlTXNBa3pxZDlYT3BmY1Vk?=
 =?utf-8?B?WHR3S0JEbVZzQ09SY00rVjNFL2MydFdQOGNvSUhFSGx0aVYyWlBUeGg0UXZt?=
 =?utf-8?B?cjZWRWc0QTRneXlTVjBHNGVXbkNYYTQvUnRUaHI5dGg2cFdBN3BVdFVjNXhk?=
 =?utf-8?B?MVVyS0YrMzhjZndwNTMyL1Mxb1dYMlZmcHdXYTBpckR6WVI1ZUYwQW0wdGc5?=
 =?utf-8?B?NDVRV2Q1YVpKYTA0aFFlNlNqTWsxelJxMzRKY0pkVjZrRG5VZFJUV3NmV3lr?=
 =?utf-8?B?UGR2L2hKc3F3K0I5QmxTK3JuNXFEYjRENElLVUJ1cWdlYTN2bzBZcFUzR3JJ?=
 =?utf-8?B?dmIzK3l3WVlCemg3Y2NvNjhaTkJPa2VnNWVQdlVSanp5TUxmbVNpMjZhWDQ4?=
 =?utf-8?B?cm1lVzdPQWg2THNRUUwvT0FnbW1BbnJaL0dQMDByNnJrVE5ONlZQRFUreTdE?=
 =?utf-8?B?OWpseWZ2WDZ1b2VsYWEyaGlnMWQ3bmU5U1ZpZ3VWMHdJck1KTXcraE41dWN1?=
 =?utf-8?B?ZHRQNWpTNzdxMTBHS2VVWjJ1NXAvd0VEZjZhY096ODAweHNEZ2xNSDlkK2tG?=
 =?utf-8?B?UWZVN1hxK3dReTYwVmZoV0MwYmVJSC80NnJwQjJLZEY0eDhzakJBTVcwNHpF?=
 =?utf-8?B?TnVlUXBQNnJSRjBiSm1yd3BmVTZZeEs5U3ZWQUIrMjY5VmRyRUtOaXdnbmU2?=
 =?utf-8?B?V2Y0MExmQ1pqRDkrYWFJbWpFeUlnMEx5NWVncWZUWE9DcmdhZUw5WWF1alpT?=
 =?utf-8?B?WHV6eTlQdEhRcHZXRkVEa3l5L3Yydisxdm03TksxYjBOTmplQXhwbTBzNnZW?=
 =?utf-8?B?Wll1M1pQWHkwQ0RiR2FNMHlzYlRFazN4ZHVkWFVNQ2UyK3pGZlFuVnZueW1I?=
 =?utf-8?B?N1pOdVFLSndSNFM1dXFrQnljQ3Iwc2VuNEJGd2NjcStaUEtVMi84UUxXL0h3?=
 =?utf-8?B?VnhOSEhSTUhsQU9BcmxUd0Fsa2ZETm96NlZTbkx5eFZDSFltQVA1VUVUVWFL?=
 =?utf-8?B?Y2pOUkRBRjArUk8rL3VvMUtVMEcvQU9KbHVkSXJSK2J6Yzc5MDRsdk5LZmRs?=
 =?utf-8?B?dGtkbVZEZW05YjZZODBVWDRTLzJrODVlTmY5N01udGdjcnVyd3RZTkw2Vy9y?=
 =?utf-8?B?TDZVRzZkSGI3aXpGelJTZWJpS1dvbUVmMURJc1RYMFhvdWt2bFkrZUpBanZz?=
 =?utf-8?B?QW1MbVlEYi9NaGhnb0xYbW96NTVIeVBua2VXQkRWYTF2SEpvZEd1OUl0UXV4?=
 =?utf-8?B?Q2V4b0pNNFpja1ZqcWtaK3RQUXN1MXpaYnE5U000N0ZWSXV4akFhb24zcXlV?=
 =?utf-8?B?eGRzR2pvalhwaGRYSVZQeWlRazhodUFQeWd6VXZLUDJzQUpoWDVZMStQckhD?=
 =?utf-8?B?d2d2QTFpcHB1UEk0K0g3MmF6aTRNTkRMSVFmYzBzSTM5Z3NHbjNtRWVaRGVW?=
 =?utf-8?B?Vmt6WkRyN3NDOTRUbTU3aExzRDluVzBkQWFkelpGT1l1emtFWUdLUXBWWk13?=
 =?utf-8?B?QjE2U0tZZEk0dW5QWFFCTmI0OGJUVWpFUUlRbzMrK0FlT1VsaFdJRjhFNTNj?=
 =?utf-8?B?Q29RcmMrUnJoUFFTRWs3NmJQKzBQMDJEMXJHeGcydms1K2lXeno4bFphNllS?=
 =?utf-8?B?NS9tYjRhY0hWY1V4VlowcXArbW1oMk8xcWJYR0pUNGc2MmNjcnVaei9qdExO?=
 =?utf-8?B?cW5GaUNwK2F2WlBqZktMOXlSVzZ6bnpVNE85YVJyYUZRek4wMUFGQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0870bd39-5b2c-4f72-ac03-08deb81e561b
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 16:22:36.8352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6K2s4Qd/NenGswAcC/2OuduqdZS11wXIxHhLFCzQJLuSpEXWzagaY79OUMZxnAigBZLZTjHdUstp1tITE38+CopUQNsJVaK4bAj4GO+RNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10204
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 May 2026 16:22:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9530

Hi Robert,

On 5/22/26 6:18 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> As an accompaniment to earlier commit
> 0d05dedd62a6d4c726f120a23654ede1f0b23d8e, correct that the
> PACKAGE_EXCLUDE variable supports the DEB packaging backend.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>    sorry, forgot the word "variable"
> 

in commit log* :)

> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index c65794229..2773e9864 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6927,8 +6927,8 @@ system and gives an overview of their function and contents.
>         an iterative development process to remove specific components from a
>         system.
> 
> -      This variable is supported only when using the IPK and RPM
> -      packaging backends. DEB is not supported.
> +      This variable is supported by all of the RPM, DEB and IPK
> +      packaging backends.
> 

Considering those are all the backends we support, can't we simply 
remove the paragraph entirely?

Cheers,
Quentin

