Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059DED3E196
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 12:02:15 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.70])
 by mx.groups.io with SMTP id smtpd.web10.16629.1729598533484953251
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 05:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NqDWn8Ju;
 spf=pass (domain: cherry.de, ip: 40.107.105.70, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmIduJRhsp6XhafDAYGoPy4tCYWBNKno6f+/56jqUQ6iXNF+VBS+8ZOCh3GBMHzgP3h43LYnDQnxs6C/kYI2Aa66cUv1YAf2qdT/j3O89SrLIqhCbdzRQnlnuuMV5h+1pWOQEqFfVLJhxAs07OrjHfyaiGzVh89QV6e8VB6qrvvtt/guO1348IcFFvOWxYiQiynRZVwJ2IJO3qVj1qF8mGFmwpeHEcplmf57RaTRlyezQtwKEfB5oa7Iv6KsPm5Ho3ROXWca8lMLgaNUBVKf35HYoTp1c9oLH35vhx4jIP+NfTvxsOxjtNx+E7CUZig4rQJz81PYNzcHF1OT/Djusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THy7Pxa99hWNrFsL/r5ZlHxlKDKJiPkCw8npYtSRhPs=;
 b=sX0l+4iaPvnA5QJj/kB857doFt+Bc9BYyT4dPjyZGTF8UWOV7hnUJr87YceR6lyAZaXW3QC1k05w1QeVXmU8w6qlCLS5PuSrrxQq97AtHJ7pNQUodHN4ObiW8+4m/I1YrjDKZ13g5X3tAqu3eYFas5mfrAG9V6P0rGi241m3qMkjvDQz17WlTE5HUJg0Xwnc8BapB0+KE/tK4xv/Yf0Ok/K0qa3CZR0RWlu2oA0D6ZRNY7eNmfeYyLfRrXBNewFl3byU9zJyuDkw3kea6b5CfVHGeZA/qRXhvRq6KMAfR5T1Q24gZMBYebJM5jBhBCDqZeVu023oUrB1Rcbpy98gNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THy7Pxa99hWNrFsL/r5ZlHxlKDKJiPkCw8npYtSRhPs=;
 b=NqDWn8JutCDoyJryQT1m2uZaiTx1KR2K3JflT08bWRVMiE/szKJS/Zd/156Ayd5wwtILTbcaHQhyG4K0UXbRixFrn46ayLEJeOJAsA5COvpOwH47IggIWvnY984q5LVaXEG9VjO1N+SVXeDFi24u310etu0gj1Yel7Mio358+/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA4PR04MB9343.eurprd04.prod.outlook.com (2603:10a6:102:2a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Tue, 22 Oct
 2024 12:02:03 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8069.020; Tue, 22 Oct 2024
 12:02:03 +0000
Message-ID: <0f4f1727-ffa9-41c1-8981-352e3d8f7468@cherry.de>
Date: Tue, 22 Oct 2024 14:02:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] overview-manual: concepts: add details on package
 splitting
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241016-bug-13225-package-split-v1-1-20681130d7eb@bootlin.com>
 <3afd2cfa-cba6-4f6a-8075-698850c703ad@cherry.de>
 <D4XY661A30GQ.3E4DMVXPCZRZ@bootlin.com>
 <a12053eb-d666-4e9b-ab7b-003a3805c25c@cherry.de>
 <D52BCB7ZEZ14.186PXVDLT2R2J@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D52BCB7ZEZ14.186PXVDLT2R2J@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA4PR04MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: a23a7ab9-6188-4a8b-5f03-08dcf2915794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N3FqUUZsZE43RmJZTllPaDY0TEp5SkI1aUJZUHFlZUl1aS9QV1AvM0F0Z0dm?=
 =?utf-8?B?YjAvb2pmQUJqNmp2R0FqeldDMWtaVk1jeCtwNkhzeXdmd1RGbFUxUWpxNGR1?=
 =?utf-8?B?TFpiYWd0Wms5b3dVMmNubVJ0SzRqME5zb2JNeHFhVjM2NWlWZUg0TVRKdHFV?=
 =?utf-8?B?SVRCZDl3U1h4Qy83L1B1cGZGZndsdGNXTHBiUkFOVG81LzBMUHZWeGNaYnJh?=
 =?utf-8?B?dUhiTU9uYnhueXBlbGRjelBaOWpMQit2VGVsL0hCbjROR0JvbEl2YUZCWWlk?=
 =?utf-8?B?dEl1Qzg5TmpkSkRVeHl3K0JDeTY3RXNUU0NWcG5Lempsc283Z2NvSmdmUHdC?=
 =?utf-8?B?UHg0V2FIT2JUbDhjd1IyNExySHY4alhvVjBNb25qMWtLdGhjNnBaL1k1K3hQ?=
 =?utf-8?B?dFRWWWV0VlRFOVE1Sm4yWWtsRFQvQXhWOGI0SHZMNkt5Mi9VQ0N1TGNTQjUv?=
 =?utf-8?B?SU5HLy9CQjF0Z1FUa1EvK2hOelhxOFRLWE95SnhOd2poMG5xMUV0d0VWNktE?=
 =?utf-8?B?a2h3bHl3K1V6T0d1bmJvSnlVaUFWZmRZcXF6TmZuR244ZzRHSERudzB3Ym1v?=
 =?utf-8?B?SXV0QitBWGhIaCtYZy9kOXMzR1dicHRFUWhNMW02NEpaTGdjVlY4dTFiWU8w?=
 =?utf-8?B?RU9tQzFWbGVZcXFuY1c5T3dEWWhydUp2MEVTWlJlb3RiWktqNU0rNkNIYXNP?=
 =?utf-8?B?MmtvUjl5ay8wcHFubFpmVlA1SFlBNm9jTlNOc21iQlhhK05Md2hkZTEzanhE?=
 =?utf-8?B?WlhCUHo2Q0djM0dIbFJlVG1qWGY4UE02aVY4d0JCSUg2TVc1N3ZmRzAzeFFz?=
 =?utf-8?B?TWRoajlMY1plVCtvOFo0STkwUGJiOU1qb0wxWUpEcWlyV3RscmxON0ZJdU1Q?=
 =?utf-8?B?TjVmNzFEbjMrMFV0bGgzdGoxS3VtMXVnQXFwbjRYVThoNWJtYXBPQVoraHZp?=
 =?utf-8?B?Y2ErSHoyRFpOVHAyNEVHcmdpb3lTSWdLaWJxUlBFYTQ0eDhEKzduQjJ1cnlu?=
 =?utf-8?B?K2F3ZWkzSHljN1F6MmR6b3poOUlXZ2Q0VWFxMnlQUVd5b2E0SGRqRTY5TGc1?=
 =?utf-8?B?azJJWGdLQ2RmUzdVajJnS05wU2x5ZWFiNlVaOHg1bE90Wmw2ZFJITmdRNVA4?=
 =?utf-8?B?c1htMEFJL3BkZFM3OEN6WEN2Y1VIUmxxbkUxc05Wc29SUnViWit2WEFMSUN4?=
 =?utf-8?B?ZlJNdDZ5Y1F2SWd6ckdHVnhVSkFNd1V3M0EzMnlsZVhyOGt0aVdVeWRMSWQ1?=
 =?utf-8?B?VGEvZThwem1HZFFPdUY1RjhmWDhTWXdLY240QWpDZ043RHVqWngwWG9rdGsz?=
 =?utf-8?B?QjlHcUR1L2F0ekVGRFZVcEplODNpVVVERmt1eU1BOW41RHpIVEs2aDBoM0Fa?=
 =?utf-8?B?MGVjSDdCcER2V2tuSURtNHU3YTRLdXJDUFpEQ1hia2pncW1mTWlCaVZ0NFVT?=
 =?utf-8?B?MldhUWVxZjdzUFRCVmJRdERkdElPRWlmVDFXaHVCV1VzQXZJYTJBYTNaU2lL?=
 =?utf-8?B?cDNBU1gvdHJvWnR0allZL2ttWW9ERlhtSEs1QVc2ZkpPanJrY0p1SVlPSERF?=
 =?utf-8?B?OTcwaXYyZkNKWGVmaFlHTyt0SHZlblRRQnowSUNnYXYwNnI4NkgvWWJuUFAy?=
 =?utf-8?B?VmgvMGV0WGV1dkpSN3NRcmR6ZlZoSUZTY3g0UXNxZFpaTytidWY3a1o5UDZ4?=
 =?utf-8?B?b3hQQS8wS3pDYnM1YUlwVElKYVVDbGR0QWRTUHNoU0ZkUVptR0c0aEsrb1Bk?=
 =?utf-8?Q?OtK4ahtMI8VIaz9dTQgonJGAGmc7aGJ7Eo0b2TM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UTNDMXVCdzNsSUtaSG96OTgyZk5KcHRSb3l3bEJQQmFRdnBoL1RhS3JKaE9K?=
 =?utf-8?B?clhVTHpkekVHQXBUK2pSSWxBc29OL1J3RGN5a3ZVY3B4dVV1bHhjdjduRmJ5?=
 =?utf-8?B?N3dTTTJkVDMyUThZOWtlSi9jZzhIaEN0Yk9sT2NiZlVKRTZBOTZldGpSdHlV?=
 =?utf-8?B?RGgweDNFM0FTVzFPTU1sbVVIaDJkbWhqU3NqaXFZQzdOb1NlS2NwRHczWGpj?=
 =?utf-8?B?L0J6d3lhbjBKWCs2MGtjNCt6TzlVVnZsYzU0RVR2aHZHTXhhY2pveWVtaWlU?=
 =?utf-8?B?RzM2dVVOOHZBbGNHV25Yd013bnZSSENldUtDVXdoNTBiTndKRXNyaVFEUXlh?=
 =?utf-8?B?c2Y1bnZ6NkdNaU9Qcm5hbGJsQ3g3bllocXRTcUxzeGtEQWE4MU15LzB1VkRI?=
 =?utf-8?B?R253RmZMdGZQSlhSUHFZRjNpRUtxTTVrd2ppVDBiTDJCTXVraStBZzMrL0s5?=
 =?utf-8?B?a2pUUUZRTmZVK1BpNjZvc0M0a28wVXc3bnZ0d3F2VlYrS21uQjNvNVg3ckxh?=
 =?utf-8?B?NDlGSDVsWTN0anFTVFh6TEJlbFhhV251UVk5YWdDc2prRUs5UnpKSTNUSXIv?=
 =?utf-8?B?Zko2NVZVZnpIM3lGT0lOOU5BdDhsVG5vbjcwZERyOEM2di8rZktNaDExWVZk?=
 =?utf-8?B?dUJxcUhhL2gyK1lnOHI4WTNEWUFFbDRCZDlmcnFDZFNrKzE2dFRETHJZd2Jp?=
 =?utf-8?B?b2svRDlrRjdZTFlLZTNrQ2xzYlR1N1BLdUg4SkdGUzlzQXYvbDkxamFJck5R?=
 =?utf-8?B?b21hTE5kckpCY1h1SFNlaGJRK0N1NzhrYXdOS2xka3lJbDBScU5DN1dnaHp2?=
 =?utf-8?B?UStDellFSTZPbGNPTFBXSzdaSktOcmhoeTMwU1RoMFErMzMwOUlNQ2gzSWFY?=
 =?utf-8?B?VE4wdWlUdEllKzBRMktwRDBBZVA3UzVLcVVNTWhJdHE1aXRaYVdaclhUQml5?=
 =?utf-8?B?WmN0MFcwTllrT1ZHdWZJRmswWjlLajdZdkNUSUZJTm9wcWtZbEY3OS9BZVhD?=
 =?utf-8?B?ZzA0dGZpb3AxTDZwdG9wRXRSZk80YkhsMS9SMk1vNVJocDBmaldoNG5NMDFj?=
 =?utf-8?B?anV0REYwN1kzVlYxbDdwV3ZWb3h2a3A2dHdQb1NmTjZtRzZSWXE0a21zY1BO?=
 =?utf-8?B?MVZKMXJZb0s5TVpzZkVkYVg3bWRZUlBMWU9KM0lPRmU3NmZnek9Yazg3emdl?=
 =?utf-8?B?V2hRd1ZTbUpBUTlzbnUybStrWGZCdzZZd2lBOUR1ZWZwT3pDamJPaXo0OFBT?=
 =?utf-8?B?ZlZuditmTDFHWkhrSXhzZ0YxajMwNHByT3RNbml4NnBpVDRVeEhWQmdHcXF2?=
 =?utf-8?B?dmVSMkJBaXN0SU5IeC9DUU9VU3NUOTdJV244amVtOUVuSERCVFpBUVRUUDVG?=
 =?utf-8?B?YlU2QU4zQUFOajdVaVZhZEJOVjBDLzFZaDNuQTJTNy9FZ1lkSFF0RlJSYXJW?=
 =?utf-8?B?dFJyUXhwVmVYUnRiYVdBb1J4K2luYTJyc0xRY1hBeGp1aVhzdzQ4MXJBb3E4?=
 =?utf-8?B?Z0xRUGErVmJzS0lvRnMyUmdSNTgwdUVhRmM4NzY0NDdKZTNkcVJXZGt3YTdN?=
 =?utf-8?B?Zk1CTStyakRpUCtWak8raXhwLzVyUE5LL21LYWtPazdCaUVzN1NVcjhhckNP?=
 =?utf-8?B?eVFGSHNzM3RvaW1xRnBYK2ZwWHh3UW5HOVpBYm92c1FUejlzWmU1WG5BRWpO?=
 =?utf-8?B?clZxMUFhcVhBTm5LNzFpR1lENFh5TFBza2h5Q2JmRVJ1Z1lJQTAzdE13TTFw?=
 =?utf-8?B?SUo0bTF3TktKbGdRU0xtd3B2eXhsWGNvNHIyU0ZGWFNYZithV2FhVndFRWZV?=
 =?utf-8?B?M25RU3JUVzdyWHFrMHAxQzBaWGdrYkc0RStRYXIwaTJLSmRyRzBSNFFkVzl6?=
 =?utf-8?B?dHppV09kaHJFWWhhWVQyNDJzdlpqdmp4ZStaOFFVclJzcFoyRzRYYVB1eFI5?=
 =?utf-8?B?ODZnRTlJUGFtZzNyT0Y3VTlEWnFpd00va3pKN0FjUUMvVFJpMktaSXg2cXkw?=
 =?utf-8?B?ejUvdk1qbEdVMjlOMUsxQzJKVng4Y0oxQXMrMWNRUlRGWDBPdEFCdWR4R1pS?=
 =?utf-8?B?ak5PNENxQmE1eSttZ2VzWTVmSHJYY1AyeEM3VnhKZEdyMjYrUHgycXdtZS8w?=
 =?utf-8?B?Wk9nU01HTWJYZ2h4bE5jMGw3dEQyY211V2N0UWNFRGxibVJvLzZwTXBLTE9I?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a23a7ab9-6188-4a8b-5f03-08dcf2915794
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 12:02:03.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMZ+NIi+GRqjSsYNV/MieavWkvFO/jckN3b5Rf47nbi3QcVT5WbStFH1hfhU4UOsXC2hOxrQPT3OorZCXfB9+UqFtJasLeKvAuTRsWINPIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9343
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 12:02:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5558

Hi Antonin,

On 10/22/24 1:54 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Fri Oct 18, 2024 at 2:37 PM CEST, Quentin Schulz wrote:
>>>>> +contains development-oriented files only::
>>>>> +
>>>>> +  FILES:${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
>>>>> +                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
>>>>> +                  ${datadir}/aclocal ${base_libdir}/*.o \
>>>>> +                  ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
>>>>> +                  ${libdir}/cmake ${datadir}/cmake"
>>>>> +
>>>>> +The paths in this list must be *absolute*, and must use the path prefixes
>>>>
>>>> There is a very important piece of information that needs to be added
>>>> here and a source of many newcomers' mistake: these are absolute paths
>>>> from the PoV of the root of the filesystem on the target, NOT from bitbake.
>>>>
>>>> Indeed, in do_install (and do_package, etc.) we need to prefix our paths
>>>> with $D (and $PKGD/$PKGDEST) when installing/packaging files, however,
>>>> FILES doesn't not need those, even more it should NOT have those.
>>>
>>> You're right, will change to:
>>>
>>> """
>>> The paths must use the path prefixes defined by the
>>> :oe_git:`meta/conf/bitbake.conf </openembedded-core/tree/meta/conf/bitbake.conf>`
>>> configuration file, such as ``${sysconfdir}``, ``${bindir}``, etc.
>>>
>>> The paths in this list must be *absolute* paths from the point of view of the
>>> root filesystem on the target. For example, assuming the following path is
>>> added to the :term:`FILES` variable::
>>>
>>>     ${sysconfdir}/foo.conf
>>>
>>> In a later phase of the build system, the created package will be used to
>>> install the file ``/etc/foo.conf`` on the target, since ``${sysconfdir}``
>>> equals to ``/etc`` (unless explicitely overwritten).
>>> """
>>>
>>
>> Note sure the last paragraph makes a lot of sense in that context, I
>> would simply remove it. I realize that I may have mislead you in my
>> suggestion, it was intended to be a justification as to why I think this
>> mistakes happen often, because we often have an additional variable in
>> front of the path as one would see it on the target.
>>
>> I would add a note to make it extra clear that ${D} should NOT be added
>> to it. It's implied here by "omission" but I've seen this happen too
>> many times that I would really suggest adding a note for that common
>> mistake :)
> 
> Something like this?
> 
> """
> The paths in this list must be *absolute* paths from the point of view of the
> root filesystem on the target, and should make reference to the variable
> :term:`D` or any :term:`WORKDIR` related variable. An example would be::
> 
>    ${sysconfdir}/foo.conf
> """
> 

should NOT, but otherwise yes.

I would also states that ${sysconfdir}/foo.conf is a **correct** 
example, because we finish the last sentence with something to NOT do 
and then provide an example, so it can be a bit confusing.

Cheers,
Quentin

