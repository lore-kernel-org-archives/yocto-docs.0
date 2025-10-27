Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1131CCCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 13:11:25 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.63])
 by mx.groups.io with SMTP id smtpd.web11.32231.1761570680777672477
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 06:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=VfvhS00Y;
 spf=pass (domain: cherry.de, ip: 40.107.159.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBzisOd1r9sP87KZpvm3lcXXSz2caXydziLZdHLcFSjf2VYdjnQJrXZzqdwYhZAG3UBbrXzdSUe8wjMUH3n5zYlfT+SvquG/aClaJnTZdMou2KsLJUDsm6MJnyMiP8nHmoMi7AQesyN1sASLH4TmDQJJoDQjH9kdlrR/f9N8tYh+xW8CCHiD671uoaoKadhQnWggn1xg04c7Uh/XBUaZ/FhYHJgMlLsDK25vTvoq/B60XhfBrrPhr7dkTYGq20TmBvYtRQNoTFG8hZoaJMJIhy3dfHAn+p6TSN2qMPtxtvISIMstUOfqt/Eg0qjnphcMdT1UKNkGle4nz7do6IEMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXvt3wiAAt5hnRnilhPKIQLrJRK4XEDB1oufyLwlleQ=;
 b=tN2dNVupJHVXBRwwEkaXi7XFOS/0P4sFATvumDDIzkocm6ANSeFL7i8FjqRCbXONsbISaIYbsU/ELjM0Psv9oFU6zlRiWPJIvVmqNtnkXg7LVQVuJwwVljvtJrXhExIgpqDHyLlRlYVvgFzFtu+D2ERbTzZ3wRptTsbqFROWG87jFkw1Ho69S2wVYhSvNL7EiZug6sOKTy2xyiJbThUIFWHhO3iLzzZLOdNL6Sz+hYduvz+Ylg3XzdRWpLumljmsZ/gnyijxtSkvzrxb8uoX51Pjx+0WJe8z6/CawAKK8f8y898PxeX7N13YY6Rb7bwayGnAbIvYyKkUGE8JwX/dKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXvt3wiAAt5hnRnilhPKIQLrJRK4XEDB1oufyLwlleQ=;
 b=VfvhS00YRL2gL7/XxGLCe6WHz5vXeqPGZlEsV9cDqSGiO3//zQJ/S4BjsRndbQNPrXj97g0rSTwCSbAt+gQxokkp/fRcROcx/zei+KwrKOLUfw2Siq6pbt/XXgF9PdvPGpLAHdQ5PjE6ZoIrwppCj1itxNM4oOwJtS1zcCXgB+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB8011.eurprd04.prod.outlook.com (2603:10a6:10:1ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 13:11:17 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 13:11:17 +0000
Message-ID: <d96b6517-45a6-4eee-ae80-7466900d5da3@cherry.de>
Date: Mon, 27 Oct 2025 14:11:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 13/16] ref-manual/features.rst: add entry for
 the coresight machine feature
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
 <20251027-release-note-5-3-second-hunk-v3-13-07d36e2380b8@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-13-07d36e2380b8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b55898-c3c5-4c77-8cfe-08de155a5055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MldFbVpJTnVsZHE2Y0ZPNUpRcm0zSnNvaEZmOFVMRVFnN21PbFpQbFo2NklO?=
 =?utf-8?B?VGtZRFpXRVVsNmNndlNXN3ZiZDNBeE1PR2Y1UGx0ZWV5V21hb2NoQU5TM2ZW?=
 =?utf-8?B?NTJialNWdEoycmtDRjhDQ2Q0WEVNSkZsL3BJcitTWG9RbTgyS2ZyMlhESFFI?=
 =?utf-8?B?OE5mbXVFZ3lXZFY5RFB4d3YvQTVTa0FpVUNROWJtaFhlTy8vdmNydldZbGJF?=
 =?utf-8?B?b3pRWVovNkg3VktQM05PN3lXRVdxaVYzT25JYTVhSk9MQXlHd1RKUUxQdUlZ?=
 =?utf-8?B?ajZQWWV4Qy8ram83eEpoNkthcnV4S0dDNnM4a1VKNFZDQkVpSDhDaDZaZWwz?=
 =?utf-8?B?UUVTNmc0NXVzb3duYXhRYncveGp0TEpuR004QkFoNTBWTlNCVEw0ZU1CYVVm?=
 =?utf-8?B?Unc0bW5jK0k3MWNaZmhldXdHV1VlUXE2MEsrazJ3K09acUxxV3FkWktyZW82?=
 =?utf-8?B?VjltdXY4Z3pDdlJ1SS8xMkxqcVBqYzRDTmxqVklsZUwrTG1zUHRkMUJpOVNr?=
 =?utf-8?B?RE1BeW5vR05zSTcrclV4ajh0NEpYNkI5RjBsYm0rVjhMNzBkaElaZ2FrR3E4?=
 =?utf-8?B?T0wzY2J2c2IvMEcxcHRGb2pEejRkcU1hdnBsMGZTMkxMekRlWFVhQVVTb2N4?=
 =?utf-8?B?a0NYTjBHb3dhTElPOGFQOUJuQWlEQmxSL2JLWmNFcmwrVDBOSFF6Zm5ZQTFa?=
 =?utf-8?B?WTZzNW9sQVFnNWtmVFkrRTRRdHRzUVJRSjJKSXRNTGF3eHIwU3E1Tkc5K1du?=
 =?utf-8?B?c05WNDcvdEtHL2VDRmRNbnhWeXY2TTUrVURoa0ZuaEg0bURrTXM3U0RUMnBP?=
 =?utf-8?B?WkFwOUZZcWwzTjhIOU44aEp1eGZweWNiVzBqaWx5SElwbnBiVzNuUmFQMVJh?=
 =?utf-8?B?MXZCV0RpVFloelJlRERXUHF0ZzgwSHFJME91WHN4eDh5RDd3VVB0Yzg3SFRB?=
 =?utf-8?B?eGZWS1FIa094dFdRZFkwUmlzRTdBSEhKS3FsbG80eTkxNnR6azNkdEdPdXZM?=
 =?utf-8?B?OFlzZFRJWkk1OC9VaTd3Z2dQS3ZoUGVLOGQ1RWxiclFacC91K00wVFJ4QlFQ?=
 =?utf-8?B?MzFsR3haREhPWDlGNWNlQVc1bG5pT0NHMUtiZ01qa1AwTWNIUVlNeXUvaVFH?=
 =?utf-8?B?S21Ka0FFNjVMT0IzeWNIOUczQjZveFJJUGhzanQ1NnE3dnZLbzV0OFRQb0ow?=
 =?utf-8?B?R2g5ZC9KQlZmTlZvZGp5a3puL2w3bDBYbVRGR1M3QlU2dWZiT05xN0Iyb0FT?=
 =?utf-8?B?amQ4akdleVVGUHpyaUQ1dDE2Z21iNkFObStYTEQzVjRTeVRGWHExR3Z5QkFm?=
 =?utf-8?B?d3hLZHRuQUVhTk15QkRvL0Fuc21EUDR0ajh4dkIwT21TNTBHblhkYXRMS1c2?=
 =?utf-8?B?RS9FWExEVmg3amZVKzMzOVlpQnUrTjFUamlGMzRHbE1YbmdWejQvWVlrbHls?=
 =?utf-8?B?QmJLQ0pydnUzbnFveTI0ZHNkTCtqcjYydjliMmF4RjhJRVQrdm9RakRiYzdW?=
 =?utf-8?B?QWhsYU1XU1YzOTRDalYzQUxsaTVYNkhrSWl0UlF1a0NkeWdUcm9zcnJkY0Q5?=
 =?utf-8?B?d0tENUh1MjZ6UloyZlBubURqSGEwY2JtUE04Z3pFay9PSkRHOG9Dbmc2dU9z?=
 =?utf-8?B?MWxGckNRTnR4OGFmK2lrbU80S0xSVVlCUnpydDBzOGlYbXRXdVZ2NUY3Q1py?=
 =?utf-8?B?a1BUYnpTR3Z1cDhWdEI2UStrTk9DUitqMG5KbDdVSkZ4VmU0TEtTaEJHTkJK?=
 =?utf-8?B?TitqRFF0VnRIZVBFNXBPOUswWk5HZmVVblU2b3UyL2FPMkhhb1NIQmxrS0t4?=
 =?utf-8?B?ais1VWxvUUFQMFpYWm5VRHFQRE1Pc1lwUlVEY3NJQlhKV09UdTJiOEhZKzdl?=
 =?utf-8?B?U1ZyVWZYVEo4NGRST0sza0tSOGd0dzA4c1hkOFduUm1IM3Rack1zT29XTkJQ?=
 =?utf-8?Q?I48Pl9gn7wZha+FLJI4UFAqTQZOTYOiv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXdVOFcxV2tlWURsWGttd2RsenRKaEJ4SjBaREtVbzhZR1NuZ3lmb3dHZWtV?=
 =?utf-8?B?c2IvaWorMTNiSVFkbnZWNC9XK2tsalhRTUdYMGJOaExXNEF4SEZlaGVWR0Nl?=
 =?utf-8?B?ZFdZM2llNjdLYW5UdnM5eUY1MEx6UHhSSkxaeDdObXdxY1ZzUTdLZ0pZMDhm?=
 =?utf-8?B?WEFubDNqN25wbTgyMmZQNXZOQW5VVlpPeXYyeWo4ZDZXZURhNm5od0JDSEFV?=
 =?utf-8?B?ZitxVDdiLzNtc2tnZXNXS3F1UFQ1Y2tUcE13Wm1UVFR6NU85ck1pajh0V0VM?=
 =?utf-8?B?QVoxaFBORmozWXkveCtQNzBHeHRwck9FaVJOR0IzVU8yaEljVFpITjZ1eVQ3?=
 =?utf-8?B?ZUhibUFhTGx1aGh5ZWhGVzJXK0tFamFIczZaay96TldMeXVUaUU5aG41WmRD?=
 =?utf-8?B?QWh2b1NvMnk1ZDdYYjIrWW5BSU9vNWVtdEkwRnV4aU52QXdDMDVOYnVBaEt2?=
 =?utf-8?B?d3ptbkpMZ0toaEtxcE0wbTl5aVpsc21tUFNLL3h2d3lBOW9UYUlXUUVTRWFn?=
 =?utf-8?B?WnA3UXBwK2tKMUZKbTAyWEpMOFdRM3FOdXV4bjBXMmU2ZTRDSTZBZEhmb3Yy?=
 =?utf-8?B?eFEvODc4M2E4R3VQUXFBUWpmN0V0anBiOHVOWUVCdWFUUWdNMGlvTm9MaVNw?=
 =?utf-8?B?NzVTN0wzdlpjWFNLV1d3WStKYnd0THVWREVIc2lvYmU1OTFxR2dBQjlsUDE5?=
 =?utf-8?B?b29iY2RUbmJRNWtwY3NGVXcybGdhUUlnRUhTZko0cFBISnpuS0EvcGVKdGEy?=
 =?utf-8?B?M3U3TUY0Q1RiV2IzUVd3OHY3M3FPM2tBZmtpcURzbTAvNER1UHM2VDFQbVJW?=
 =?utf-8?B?c05TOGVtLzY1VEZpdEszemltdERWY1A4eDhsR3NHQ3FYSGtKZ0RIN1lsWlM4?=
 =?utf-8?B?aExNTDNRRFB2ZXBDajhzc2FNN3diS2hBWUIyMG1iOTV0QWdxVG1rUE1BeWhD?=
 =?utf-8?B?NjFidFRRMkRGTHdhbGdRTGN5VmE5c0hOdnozWUcxdCsvai9rc2JoRHRUMlpG?=
 =?utf-8?B?cFBoMTF5MTVpdjBmZm4rZFlha0tJWWlyelpQejNnM3YwdVlDeEJZR2EzUTBv?=
 =?utf-8?B?VFc5ZU1UR0VXckdJalFPVC9hWkFLcWZxdHZIc2ZrVCtwZHBEbTdaNHNQSU5n?=
 =?utf-8?B?TDVybHBtK293ckkzdVpheHJyTGNCZlQxYmRjV3pHQU9WNVdVbFZZb1VyblVD?=
 =?utf-8?B?ODRmN1BLSlp0WHoyRHk4SzcxcHVBVlRyWHFWcHJZMTdJY203OWt0QW5GZi9t?=
 =?utf-8?B?RjYzZE14dTZ3NlR4Z3NTU0srczE5WGZxYjJOSE43QndZb1d6Y1R0SDdFU3Vy?=
 =?utf-8?B?b2pyVnVRMFlnNy9TM1JBL3ArWUY0WFlrWHZnU1JGQWdQRTBZWGxhdHQ4VVFr?=
 =?utf-8?B?cmdSZ3JxbHcwOEpNRTFaYTBVT0puYWthN2wweVBpSHoyK0tlbjR0V3lPaUlP?=
 =?utf-8?B?Z3Y0VzVlZS8weUl5WkFoaGRvcitPMTN5Qms3L3Z1VzBienNCcU80dFJNVlN1?=
 =?utf-8?B?bFBaR09hSG5kRkdGcE1wc2lld0lWeHUxaGdBVm85YVNEOStDcTU4bUhZTEZr?=
 =?utf-8?B?WmdsRDU1Q2ttSkg2TStIeVpzckI3aUlvbVMxdWY1UWJZaHlGaU9EWXUyUjNN?=
 =?utf-8?B?SmFyTU5uWllHcVljbVdpT0pLVld2SXQ5d3JzNGVEZXdGTVlPdFAyQ3ptSVl0?=
 =?utf-8?B?Y3F4N0RKMFRMU2xybnp6YUhMdUVianVGY215Q3hMUGRScjF1V3VDK295Vldp?=
 =?utf-8?B?TzNpelhTWGtmZlRVclU2ZWh6NVU3eFdBMDVvZm91cmc5eGVsYzhYanAzaW5P?=
 =?utf-8?B?cUJqc0NLOVQ5VFVjZXNPRS8rT2JMTlNHaFZVeHFBd2ZRbWoybXBjNFZUYjlR?=
 =?utf-8?B?NEJDWmJzMXR0dDcwVjVxSHdzTGVIbDREb2ptc0dKekRTZGphYjlYWmNiVE5j?=
 =?utf-8?B?YkNpRWI1a1U1MWdoOC9FcFlCK1hMZ0tqVUMrVHVHWEFLcEZJZHVJeG1Yc1JI?=
 =?utf-8?B?WFFITG9FVnZ3TnpudG5VN3Bqa0JZamUzOGJJMmh6RUxvUXBSbFVrT1lwMlk2?=
 =?utf-8?B?b1lWazM2Y294c2kwN2VtR0xFYXhuclZkS1kwZUQvMVplUm1FckZtRHhRYWho?=
 =?utf-8?B?R2RMNGZlM2xsVHAwY0EzbUJTekhDcnlZNmdPYlFvd0pqanh5ZFAxWUpJdGx4?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b55898-c3c5-4c77-8cfe-08de155a5055
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 13:11:17.3357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdELY4nHhuHaLHN6hA0O2peivq4ilDNCvkfq4z2Yw//x8JdzsJIwoBZzMIZb2AOy0FqDaLJx4hZQqQ/FkQNlfKrfZ86oUpgqWJPsAdXM9iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8011
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 13:11:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7870

Hi Antonin,

On 10/27/25 1:43 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Added by commit c455bd039104 ("perf: enable coresight if enabled in
> MACHINE_FEATURES") in OE-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

