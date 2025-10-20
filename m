Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2229CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 16:34:44 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.59])
 by mx.groups.io with SMTP id smtpd.web11.1838.1760978073827799785
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 09:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RqfIhnxL;
 spf=pass (domain: cherry.de, ip: 52.101.70.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=me8nQPMmsfPTPfN8e+1Efx/hP0Cc0/gvzpJyXl55jqw2VZnvNjD+QOGPXwQANOR7inN99DP+/Gyf21jjUnu52wg6xhHns0XxvJk5IjcPDTP0dimiQ3udFR3TpMbFFxM3vmABwGKVwZaC3oZckIrC3KJpmQuSmgXLfyjcUtAL5Z0NPXM7eAf2/qSMMpIC3LAsnC4Bn+VuNHqnNL0GD6d8b6nJ1VA0v80dZOPk4vSA4vhpOR+IYhymj+QpehM+gWRhfBYbFAyobVR+sP23LPw4KAL021fElku2AOFn36vyn4S9XZuCNWeYGN2tFXzcuEDV85PJNFsKd3PKXyklPB3UmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7humVsSvTFZ3DEBjJboh1iepADmFqEIf1AUXY9jEgKQ=;
 b=wICiFrPqraO3D8tVWDe//gLDaYyp+N2D4A3+hv4loCHl9ATeftS1FVHdDcozjMB2CsPHDHRuYGpsw8hTFsUd3Dq41+NQhaWO2z8iCpGnqPJbca4ECso8SDtpP7SJEJSC1H/O8uq3gLSpCR9X2hxfGVeJmN/SoHWlEaiBRDaEupHt7U1FDwD7V18Q6Vjjl9pbZ9QsZMx297H3U1CdS0AUTPsdaw422bM9T+fOzy7CstS+Y3p/MyVrQcPV1Etl35z0IgYB74dx/9yT3nPpphaqI6edgTaJarNOvCLv8DOyKis7M9sLUP3wz9RlalpGtIEK2tkEq1rKPAWFPlkssyC74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7humVsSvTFZ3DEBjJboh1iepADmFqEIf1AUXY9jEgKQ=;
 b=RqfIhnxLyWUBZE0ciWmtmJpD/VPDsMw5jCWrysezoIw+ZsryY9P+gu86rG1tuKd3xukKJXmo1xSc22sIvkPUMU+dncQvwboV9lbkg7XzfVTTl1e18X1ifcJRJQ1ibE5TFfRXfncz/lt6iktfCVAxuF1D+DlqiDCsKTJ6b9IeJAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8322.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 16:34:30 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 16:34:30 +0000
Message-ID: <d57d7e77-635e-48d8-9962-f9dfca91be23@cherry.de>
Date: Mon, 20 Oct 2025 18:34:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: document
 IMAGE_EXTRA_PARTITION_FILES
To: pierre-loup.gosse@smile.fr, docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
References: <20251016083417.1286684-1-pierre-loup.gosse@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251016083417.1286684-1-pierre-loup.gosse@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0153.eurprd07.prod.outlook.com
 (2603:10a6:802:16::40) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: df899cea-1a36-41c2-dbea-08de0ff68ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y2o4RkU2V0xlM2dkcUNnRXNHT1cycjlOTmRHR2k2UFV3a2VmcWFtUWVucUJy?=
 =?utf-8?B?QlNoanE0UkV0L3Jqa0toaEZjbFJHanZvdDlVMHhUY0FoWTBmemNNMEVqODJH?=
 =?utf-8?B?MGxIMkR5YlNzQlBOdmM3Q0cwbzNvTGdQOUh1UlNudDlyUUowMTlvazNxbmtU?=
 =?utf-8?B?aWxMbEFrbDFDNEF1b3Y2MWhWL2dBM0NDWHFIRXJDRG0zeVgrbWQydWM2RXkz?=
 =?utf-8?B?aXlOSURoZmk2azQ4Vll6Sk0rcTBSamxXZHpJenBXTWJ6U1VUUzhVNUJCVC92?=
 =?utf-8?B?NGtxMHdZQVhMaDZHbzRqZnlMRExCZHozcy9KMTRheVdnK0RxVmgvRFpFS1ZO?=
 =?utf-8?B?V3hHYURUcEh2WGN3ejY1QTJPanhoQW1LMFVNV0lEUEF2ditEMDhJTE94Y3Ir?=
 =?utf-8?B?cGgvTzFLd1d5NWxDam5BeTRGdmRTKzNuZ1R2d0YzNFhXYXVKKzVYenEwNXln?=
 =?utf-8?B?M1JmV1NkZlZNNGZseUVzc1dka2pSZGl0RFpTRHh5ZVU5ZC9yZkRKWkc0amRw?=
 =?utf-8?B?bnlUUnM4czhGN21vczkwS3FKUW9TUFk2bHFGVklhd3J6ZThNbHNTeXFZUFZl?=
 =?utf-8?B?b05SS05kdGI2Mmt3Z25tVDJrWExZaklRZEl6emtydHZTTHBMTEhWeXFCVjQ3?=
 =?utf-8?B?eGQzcXdjelpGMnNhNTNhWkhtTlFKSUlRa3MxdzF6U1hPby9RYVZUMGJLQi9T?=
 =?utf-8?B?OEJla3YyWTBubjBPcEdNUlNxQm0vbWJGYTlGakxiazdFMVRKQmpKblFydmtx?=
 =?utf-8?B?eFpzS1BGN1hNNnFnTGpUcmJqVi8wM3JqM1pDNXZoYW85NUNxR0JLdmFOWDVI?=
 =?utf-8?B?cUNROTJVUE55ZDdGamluZkx1MTRUNkFtekxYTGNVcU53azQ0QW9ZcmF5YVBX?=
 =?utf-8?B?TUtSbDJQSWd2cStxclBHV0txbHJnSXQwSjNqNlFMclZoaEtuUTBBazVNb3c3?=
 =?utf-8?B?UWJOYm5tZENQdnA1VmxGRVN4NXllcjNYaE9sandsSXdJOWxPVUdITStCRTBj?=
 =?utf-8?B?eHVGc0w1U2lkSGRyVjlSWUFEN2VtQTIwdjRzWmZ3VUlkK2JLWnRwSmZPdGtF?=
 =?utf-8?B?dzE2NVo2bHZvbWJXTGJrMTBZN2pYTndyYXdGVnF2aGhFOWFoTUU0NTRMMVVm?=
 =?utf-8?B?eEVhcWtUanRpUGVFdWlvVnB3VDVQamptVWFuK25CQ3pFbzEvVnovMVZkaVRj?=
 =?utf-8?B?SDVtY3FTSHZwclJBVFRPd05Qa2taVVliNzBHLzI5YlV0aHI2SDlQNDRuclph?=
 =?utf-8?B?QnU0VUI5SnRSemRtUCtGWGNvUVFvTm11WFdsT1pFN2RUdEFnZEpFN1hTTlN5?=
 =?utf-8?B?UnlvQktuZTB0UGkvb2krYlhoODdNV0lTZHNHQzRVN1c3dHAzb2U1R2JQZnQw?=
 =?utf-8?B?eXU0bktaTzJNUys3cFFibis5YWIxYlViSGhOYXY4SzhzakJYV3Z0SVNuUXc1?=
 =?utf-8?B?ZXNCUmJTQzU0dlpzN2hKRlY5bkh3dFArbzQ5UWd5Sm1yQ1RCTGdhdGkybUkr?=
 =?utf-8?B?YklpeG1NQytPTEVjZktydjkxY0xvdHRLTFlQZm9PYVhFTTV3YmZ4RDFLVjNh?=
 =?utf-8?B?aHZmYnpSR0lKL056VlhIazQ1TmE0cDZNQ1F0ZERBOHdmYmJGWS9uaEdJMjFP?=
 =?utf-8?B?RW1XYUhrSmpxOCtpQ3J6QzJqbG1ITTlrSnZwRURlNkoxQXVMd0dmUHEvOXU1?=
 =?utf-8?B?Z0x4dXJoYlVqT2NmaW5GMWNLTEY4UWp5MDZLRFVEaTBoLytrQTVuV1NvY1Vr?=
 =?utf-8?B?QXVTRkZabXcyZHVHRWVtSGNYQUtmWUxaUFlCdHA3NjBFNFBHSHhEamFDZXc0?=
 =?utf-8?B?YjBPaGV5a2J1MENtajNRU2lwZlB1aDFQN25zNXU1bzBWczREYzI4cGdaUWhx?=
 =?utf-8?B?NmdVekhxeE1sQmo1dVBPMVY4eEVEcFdPemJIWFFtSmR6cERwUWU2RkdSTmtu?=
 =?utf-8?Q?ZYGgraFhy0CgdpSM9Fbsb9OJlF8aLl3x?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q3ZnL3k2RGhZaWVrb3NQZDV0Yk9BbzNMUmd1MU0rZEREcTUvUWxaZGJwcjhU?=
 =?utf-8?B?Qm51UnVQb1NJZm9hbStCcmQwMUdDNnRINWRzM2VTcTEzY3U3Qk02Qy8yNnUx?=
 =?utf-8?B?a2o4SWsycG1tOG1MbzNHM0JsNG11T1dPZUNTajZyWnJVVkZpMnJXbmdhNUND?=
 =?utf-8?B?UmlRZzFPMnpPMVZ5bG9lK3lOTkZWaEhqZUF6anY0RU9qTHFSMUIrWW1yWHNL?=
 =?utf-8?B?d203MmIrVFQ5d1U3a0kxZFdycEtxMnRPRmVZcHlNYzdnRjBGVUI5U3FkZ1g2?=
 =?utf-8?B?ck1BZis5T3pJalRnYm9KRTFGRXJsS3hoVERoRUtNVnpoVFhnb0liY0c5MmRU?=
 =?utf-8?B?MFlwdlMyVGtuMGtXMnE2U2E1WkhIUVdoRTJKckQ3OXVuSUNRMDE0Nmw0eXdm?=
 =?utf-8?B?QW4yeXdsMktnYzdXbkNVWkluSnZRNWU1Tm02b0djV3Z3R1FvMDVqVXNubGxI?=
 =?utf-8?B?bmRVSmRQcXZJdExPRmNEdFRkV2pkTFVjRjhPVUxPSVdXZnUyQ0k0YXNEckd2?=
 =?utf-8?B?WHcybFcxamdSS3JvUHhQcUtjQWFqdC9yVXI3OUpHVjQ0U1JSSnlOV2lhbmRm?=
 =?utf-8?B?R0draUlrdDNtNFh3ZXNaVlVHNlVmaVI1czkxOUd6dTdnMmdUalRBM2ZtbVUz?=
 =?utf-8?B?OGFVK1cxUnZzc3VrQVozVGIxNkpNakJRUFc0WCtCaXhIV0sxN3daRW1LbjJJ?=
 =?utf-8?B?cnlaR2xzS3BCc1hGMk9LOWtBR0FsL09NVDROQjliYlJCWEVEb1NUK3ZNU1JN?=
 =?utf-8?B?SC9wR3IyZmQ5UkxRTUt0VWFPU3BPS2ZvVnJXazhYZGhLTC90SS81M00yd2xG?=
 =?utf-8?B?d09rQUZjRjE1bTFVcEZRQ1hVRFV6UEFBOStsRUlNVjZPUzMvaHNnRkhwYXlI?=
 =?utf-8?B?aVpVQmJtRlBuM08wMVZ5YnZ4d2RqOXRsOVlGWGpkNlArdjJyRkVPTVQwcFpH?=
 =?utf-8?B?d0tRTDUwSDVMNk1hbXFqVzQzYWpndXMxU1BQZEhNK0tYaUMwTlFZZ1Boemov?=
 =?utf-8?B?dGRYSGpuVm03U0ZkQVcrazM1R2VuUUVoRk5ldjJqTWM1L3RJWGRjZ1B5T0lm?=
 =?utf-8?B?Szdicy8rZXNpV0RoVWF5UmtoZStVVFFtdmVBQ0FlcTdyeDlqSTZyNWRJV0sv?=
 =?utf-8?B?L1M0eXlJZkY3Qk5QY1pzc3Zoa0IxREpmUEpIaUgxdTF6UGhZcWhzZC9uMUpV?=
 =?utf-8?B?eTJBaUNOYkczUVhleVlIQ0pjRjM3L3pJbWJzdkw1MVJ3Mmd0ZWdSS1FidzYr?=
 =?utf-8?B?N2pCZ1Ewb2VPbkNsUGxJQ2xQQ3JtSE5McjJRSVVvWUNOTG5tSTdrc0NtOUJ3?=
 =?utf-8?B?UlU3Um0razdZYUJRb1Y1YkZ3ZkNRNGwrQ2s3Y2tyV3MvcVJSVHgyZ010YnBE?=
 =?utf-8?B?RWlUdm1EVjVueGVrclg0MlVDeEN6ejlpSmFhOUxoTElLby9HTDl5a1NBV1lL?=
 =?utf-8?B?b3NDcHdzM2xIWmRwMVJZSm1VR2VQRnMzKzQzNUFBaGV4SnJJUHVwdGxGZkc1?=
 =?utf-8?B?aFRNZEVnTkNMRk9sNm9hTm5uRlhBRXhDN2dQUDlXMkk0Vm1wajlob1NMUzg2?=
 =?utf-8?B?Z2IvVEp0dENUMGsxQ3g3WDZwaUJvcDNhRWRxYUltWXdObVZJcml2NWsxTlFT?=
 =?utf-8?B?SGV4S1dwWGtQbTNURzZaUDFSeCtZY3dBcDc0aDFTL3NEeWtiWkdPR1FKLzFP?=
 =?utf-8?B?TThqcXNHNng1NEovV1NSWUgydCtkVmNDb2pmNjR4K3VkMHFHamdvaGVBcTFy?=
 =?utf-8?B?MTBaa3pPRURPVHhKVXRta3V3UVlXYVFUczI5di9YeWZrTVNVeG5VZTBOSVlB?=
 =?utf-8?B?YjFlM1VmbXp0Ums5dWZUMk15OC9tVm53L1pZYzRKb2pEclhjZkgwVnhRZ2xt?=
 =?utf-8?B?VWdFMTc4c1ZWS1BKSDI1eTR2TFBKSmdhZUZHN2VIei9QcVNCKzFhbGxoQm9z?=
 =?utf-8?B?TlA2SnNPaGJCMFRSYTNXRFR5NXVUUmp1bWZmbUVEamNZNWI4U0JBbFZvS29I?=
 =?utf-8?B?V2YvNDBJQ1lzNG5QWXBPazVXMjRXVzE0OVIxMjFrSmhPZXdqWnJKQk16VnMv?=
 =?utf-8?B?UUY1c0dhZ1lLamRlbFRTVi8zMEVnMWVPUjBhR0g5bnBNcTlCZVhMM2lWb09s?=
 =?utf-8?B?TkpjUVh6M2xrc0kxem5TdTBGbXJkTElKK2JLanJRU3gzWHMzMlBkY0FXSGV4?=
 =?utf-8?B?Q2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: df899cea-1a36-41c2-dbea-08de0ff68ae5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 16:34:30.1071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GcsuJCIf6UJFAOZv3IR4qCNpST49UEg2uTntuJJ4S+4cRR10y9umgXrmSzaQr4aUNO/Rf1D+Kks3jwxAY16FW8K9+XG0RAzKsHofVTXgJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8322
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 16:34:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7761

Hi Pierre-Loup,

Thanks for the patch!

On 10/16/25 10:34 AM, Pierre-loup GOSSE via lists.yoctoproject.org wrote:
> [You don't often get email from pierre-loup.gosse=smile.fr@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> 
> Added by commit 3892912bd7e0 ("wic: extra partition plugin") in OE-Core.
> 
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> Cc: Antonin Godard <antonin.godard@bootlin.com>
> ---
> changes in v2:
> - apply suggested changes
> ---
>   documentation/ref-manual/variables.rst | 50 ++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 591c03028..72791f8f3 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3956,6 +3956,56 @@ system and gives an overview of their function and contents.
>         material for Wic is located in the
>         ":doc:`/ref-manual/kickstart`" chapter.
> 
> +   :term:`IMAGE_EXTRA_PARTITION_FILES`
> +      A space-separated list of files installed into the extra partition
> +      when preparing an image using the Wic tool with the
> +      ``extra_partition`` source plugin. By default,

I don't believe we've ever explained what the extra_partition plugin 
does so it's a bit difficult to follow what to do here. How do I know if 
this applies to my setup? In which scenario should I use this source plugin?

First, I believe (reading 
scripts/lib/wic/plugins/source/extra_partition.py) we should say "extra 
partition(s)" in the above as there can be multiple ones (which is also 
implied with the later examples).

Then we should probably explain what this plugin is for (but probably 
better in documentation/dev-manual/wic.rst?) and how I know whether it's 
used (--source extra_partition in the wks file).

> +      the files are
> +      installed under the same name as the source files. To change the
> +      installed name, separate it from the original name with a semi-colon
> +      (;). Source files need to be located in
> +      :term:`DEPLOY_DIR_IMAGE`. Here is a

s/a/an/

> +      example::
> +
> +         IMAGE_EXTRA_PARTITION_FILES = "foo bar.conf;bar"
> +
> +      In the above example, the file ``foo`` is installed with its original name
> +      ``foo``, while the file ``bar.conf`` is installed and renamed to ``bar``.
> +
> +      Alternatively, source files can be picked up using a glob pattern. In

The million dollar questions:

1. does the glob pattern include "hidden files" (file/directory starting 
with dot ("."))?
2. does the glob pattern include recursively (if there is a directory in 
that foo/ directory, does it get included and its files as well?)?

> +      this case, the destination file must have the same name as the base
> +      name of the source file path. To install files into a directory

It's not that it must have the same name (implying the user has to do 
something) is that it simply will as there's no way to change it. So, 
s/must/will/ in the sentence above. BUT, you can specify that the 
directory before the glob pattern can be renamed (and you provide the 
example below already, so that's neat).

> +      within the target location, pass its name after a semi-colon (;).
> +      Here are two examples::
> +
> +         IMAGE_EXTRA_PARTITION_FILES = "foo/*"
> +         IMAGE_EXTRA_PARTITION_FILES = "foo/*;bar/"
> +
> +      The first example

s/example/line in this example/

> +      installs all files from ``${DEPLOY_DIR_IMAGE}/foo``

We are inconsistent here, all other examples do not specify foo/ 
directory is from DEPLOY_DIR_IMAGE (it is made explicit in the first few 
lines of this glossary entry so I think that ought to be enough?).

> +      into the root of the target partition. The second example installs

s/example/line in this example/

> +      the same files into a ``bar`` directory within the target partition.
> +      The ``bar/`` directory is automatically created if it does not exist.
> +
> +      You can also specify the target by label, UUID or partname if multiple

Should "partname" be "part-name" here maybe? To match the prefix used in 
the IMAGE_EXTRA_PARTITION_FILES_ below? Or rather say "partition name"?

> +      extra partitions coexist. Here are some examples::
> +
> +         IMAGE_EXTRA_PARTITION_FILES_label-config = "foo/*"
> +         IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "foo/*;bar/"
> +         IMAGE_EXTRA_PARTITION_FILES_part-name-foo = "foo"
> +
> +      Here are the simplified corresponding entries in the WKS file::> +
> +         part --source extra_partition --fstype=ext4 --label config
> +         part --source extra_partition --fstype=ext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d
> +         part --source extra_partition --fstype=ext4 --part-name foo
> +

On first read, I thought the WKS file was another way to represent the 
example provided just above (the one with the variables), but it isn't 
at all, that's just the companion WKS setup so that the variables make 
sense :)

It'd be nice also to specify what would then happen, just to be on the 
safe side.

I can suggest the following rewording (replace starting from "Here are 
some examples::" above):

"""
Let's take the following example. This would be the WKS file for the 
image currently being built::

    part --source extra_partition --fstype=ext4 --label config
    part --source extra_partition --fstype=ext4 --uuid 
e7d0824e-cda3-4bed-9f54-9ef5312d105d
    part --source extra_partition --fstype=ext4 --part-name foo

and the following part of the image recipe::

    IMAGE_EXTRA_PARTITION_FILES_label-config = "foo/*"
  
IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = 
"foo/*;bar/"
    IMAGE_EXTRA_PARTITION_FILES_part-name-foo = "foo"

Then:

-  The partition labeled config would get [...].
-  The partition whose UUID is e7d0824e-cda3-4bed-9f54-9ef5312d105d 
would get [...]
-  The partition named foo would get [...]
"""

Cheers,
Quentin

