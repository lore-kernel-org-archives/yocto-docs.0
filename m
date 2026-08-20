Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0F3C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 13:01:52 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6349.1787230908777013553
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 06:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bj5QII2n;
 spf=pass (domain: cherry.de, ip: 40.107.130.3, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtXraVP4Gd6hnjJN31mkT2RlGgOJFD1Hc5S16lWTRHJsJBcewBvu+gkHAYtxf1EaeTjuiXcH8u/L7Ydp5Zn2LtOsqmkB32s41vXwmQ8+YY5pqIDEr7ubvEwVcDjCY+4EMPl7XgxUgOib0XadFq8xlsi5++7NleK5DWtGZbeRtbEWtnbidPMo7uMqSEw4rScuhMT8HYBUQUQLDWUqqRtX28ekBOA+abYCSVBN/y4arBVyKRhV6SkHURCf4iEpJ7KF3vt9Dpvd7BT/BJ6d2JKYoNpsRISWpDFMNk2OvtzwklqB1gGnvqqWF2QlExd7pAZxNq/B9JbPZcesAoMyNwF7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tc2dy8S2fPbiJxmUmvwEWvVkoo32o7tT2wlEXMN+1Bw=;
 b=XNjZGoFU2CHfrEGTbxYlN3EkUrW6DP4t5EoHnxYjRDtuLosfH6CNVyiJiJi438sqZQ/bM5NWh49J/klwP+MB9Sn7c5H/81egbMrsptedBawxcr3wZlQGrODTIa5tph+FbCaO6CmKZjCHfq5tAtxyv7PpzgkcnVMgXEseAeNAOATcLCJVbZ5rw6glT7fAQhD6ce8QZaZ+Xvf+jvZI1FYqTNp2q8RaanqaSGSOLVzOJOFFtZ4Vg2uAnnCL33WZiTe6uZZd6T7rAzTRxoTdl1O0E8JQYAg2GEmBq3wrmQQFPCXdS7aqGB04hkbAm4JzUcnd0bWuG0VXuJ9hiSI9Oo4CJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tc2dy8S2fPbiJxmUmvwEWvVkoo32o7tT2wlEXMN+1Bw=;
 b=bj5QII2nRJUgTnnQHnGnEViN9rkc5HptEvu3WYuWaN5IBImBPsdAb4tHp04Kk72VD3deuJ3AoaoIBQzbCZXoR/AMfnzI7mrhaJpS70uVcTmg2CAHh7FTJQDzfxo97wh+BVcncamqtA/YDOs3Gz61kOQKbCS2Mb1d/Sl6ZzXCVTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by PA1PR04MB10626.eurprd04.prod.outlook.com (2603:10a6:102:48e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 13:01:42 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 13:01:42 +0000
Message-ID: <a98a19ce-f57a-4b88-8bad-bf40ab4c0f79@cherry.de>
Date: Thu, 20 Aug 2026 15:01:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] what is purpose of "$(O)" in top-level docs Makefile?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <e8f1d965-bdfb-4246-5352-bb071bc936f1@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <e8f1d965-bdfb-4246-5352-bb071bc936f1@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0040.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34d::18) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|PA1PR04MB10626:EE_
X-MS-Office365-Filtering-Correlation-Id: 429366d1-1b39-41ee-1f08-08defebb2e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|10070799003|376014|10067099003|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: 
	/3uBPy7rBM8L49uDs0nmyyITTvh397Kzao60wQCNtknuWdXkIQCRJqyEJKN5NYW0F3d7iMPZHWWbk1RRbb5FmWmBukD+/CR0m1WnyTzwGnhY5OhFtbOhj4CcNdXZikyPFD/4U+fq8Il48C5arO3xr7uYNpmUuZ7xe9r54peMUuuNgF9BjztdWEMKktt9DE2tu/TXfV0Vf+i4bQ1mQI3gLVmsPgn9k6cWAq+RfTU8BMlN+BsaXOWQaGu8SyDdXHTQF2pMidrbZmjbw0mBOBt+UsbxkbfW7CyXswDtCf9rMIInli3eakqGFMrH4Y6JKpz6cSWglGAm4LN07o73tS+q9kCiDIa4HOCAzJLGIxrfbBbZA89CxwMwWt/BkZi5fXxE+U5+YUR6FlR1eK0qX28JWvuG1pPbIKAcqItcfaSy28dzrOCyzhf5Z/HJUN5bfkiF6FGzfIJzSTqxGWy3DF8UUMZyT1/T8YoMfPfM/4ZM4xQOh8O7dI5BUBFIr+/V8bbgt+gxyJ88WlDEAaRNucPrh2VVQQ71yyfb5js/Z1kuHTxvnE66K0y3Qc8RpajtCrXZYZ0mM+jXsr6MhVkgO02sHXeRTc2tTR7RsVzdS0rKvjsFxhK+IqfLTMT0WMe6FC8acgMKAcVzWE6dWehrOPCLuRjtdcgPmvdMEr9ENMczPa0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(10070799003)(376014)(10067099003)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UGgySDVZY3ZYak94UTFrWlEvWXBmV0VBR09mWTFRWWRDbnJxeERrbnpoZExD?=
 =?utf-8?B?VDQ3QWlDY3E1cG9QakhFTmJQNm5QUnJyTlI4K0YyS2h3K0Nvd3kyTG83OEVG?=
 =?utf-8?B?TGI0VDR6c3NlT1JzZk5nK2RMQjZadUhWNEd0czBBd1B2eEFicEh6REdBdHZU?=
 =?utf-8?B?WnZQQ25zSVd1Q1lyTWdFTWwxVkZ3bW0zMEZpdUJBaXdMZ0x0ZHVUUGlLblo0?=
 =?utf-8?B?VTNINktpWGdlQmlvZGd4bmJIaTVITGVpR0wxNGt5TS9rTjNQN0YzemwxczVu?=
 =?utf-8?B?MW0yeWZKVGNhbmhrWU9WVU9pWWhoR2VvQzNYN0hISW15dlhJZnBGRkVWbmNs?=
 =?utf-8?B?REpncU1UaXJTZzVBalFMa21veE9mWUtoSmwxandaRjl6Um41b0Y3V1lwTVRZ?=
 =?utf-8?B?TzNXK2tHL1ZhMkk5UStXV1Npcys2WTBYdDVQWHlQdERMNnh6dml2YzI3RDBY?=
 =?utf-8?B?QkdneVNyVXZpMUZoVXdqNFl0akhYT3VsWE5PSkc4QUx2bzRmcVBtSVhkS05Z?=
 =?utf-8?B?dUtVdkFoSk9VOVp4UDRsZ1J2YzlPY0UzVzYyUk9oZlVtSEV2L0N0dm1tb3hj?=
 =?utf-8?B?bTVWNzlxT21FVngyY3M3RTEzK3lCUzJvdmV1dHV0WE9OcUhSZ0ZUVm5GWmlY?=
 =?utf-8?B?S3JoMFVyNHJTaE1iZWc0WlhLN3AyVyt6djNjRzFLZThYd1JxejM3YTRPZGVX?=
 =?utf-8?B?L3NLTVl6ZitwQVhCaFZpUksybXRPR0xzbTBzRUZaT2ZmbUQrOVlFdnBLN080?=
 =?utf-8?B?ZERRaGJJRjhVYmptbnViSENxRzRCNm0xOHQ4M2lNWVh5VlRGYzhNa0V4bTM3?=
 =?utf-8?B?OTgwWHR2aEhpQ3JrcHVSeDlYVlY1bEdFVFoxVzZ4UjI4RkdjelB5SVc4bi93?=
 =?utf-8?B?WmNmL3E5dVdEU212WTIwaUVBNHNHU2ZFZnNsNlZkZURVYUp2ZHRCcFNwNEhX?=
 =?utf-8?B?b25pL1k0WDlGRlF1ZkdnUndjRFlORXdudU14T210U1VSTDJSb29OQzdaeEdZ?=
 =?utf-8?B?ZEV2Y1BkMWZsUmdaL0RzeEk1UWJYR0t3eC9vbnc1WkU4VkxNeDdIR2hpNFJu?=
 =?utf-8?B?bFdXS205WE1LcFhVL0R2WFlXK2ZPNmlUSG1udjBvYkU4ZnltZldVNW96dzhz?=
 =?utf-8?B?ejBMRmpFMzk2bElrUW5Ia2xGNE1tNVVnRTVLNVVabUR0dlpuWk1WTG1MZDR0?=
 =?utf-8?B?UUE4K0VhbXNiK1Vtd1dRUU53eWQzekNENnZOR0k0QnhjZGl1Und4TDhKdHdL?=
 =?utf-8?B?eTB3RmlHeUM4dFIramlvN1dOWisrN1dQWW03bklQdmo0dDE1NFJUQWRQVUhC?=
 =?utf-8?B?S3hNelh6NHRsYjkyR2JucXc1MXhhQzFMZXk2eWhDb2U2TEFGM3ppbXNzWFY0?=
 =?utf-8?B?N1BSQVZiaGY5WjBGSUlTK1h0UkJxL3MzUzlSZENRR1VLN05pL3dCYkJVQmxo?=
 =?utf-8?B?N3JZd3FDN3gvUGJ0ZXczRXFUS3ZFeVdsNS8zb3k5ZDd6MHJCVUh0dVpSS2lC?=
 =?utf-8?B?L0dHMmFyRldjNHp2RE84WTdxQ2FLaVk4NC9SNFNQTVJwajc3cDFaS1B0Rjli?=
 =?utf-8?B?MXRkL1BWbEhOaUhWUHZKYkU5ZnFmNkJKbFh1K29BSWppN2w1QmEzSTg2RDd1?=
 =?utf-8?B?K3AyRlU1bjN4M2N3bEJueXpKMVM3TlEwMHlkdGI5TzZ0UEZFRk1BbTcwYlRk?=
 =?utf-8?B?NWJRL0RvdCtISGUwQVVUd1FWcUt2MDNra0UycXBFSUtHYVlYWFBYaDFCQk1m?=
 =?utf-8?B?N1IrVGtUNmhORHFmbmtBREZWSnF5dVVVZU84WTRaL0JENmwwd0JGNG5Wa2Ru?=
 =?utf-8?B?eFRmRHY5eFFXYnZhaHZ3L01nTzAwdkZWYkVJMWV2aU1oakFKUEhQMlBQY2F1?=
 =?utf-8?B?OW95U1Fjd2I0dUJETGRyaGpLY3NWRm9qQlpkd1ZaSk9rYTFOWTZDbDZsa0dw?=
 =?utf-8?B?M3oybi95cUU0S2l0ODh4aUdrcithcGhDaC9la2tIall0NXU2M3F0WktqQ2tD?=
 =?utf-8?B?Z09PcTZLU2ZJb2Z1RHdxNE5JRWJLYzR3SGUveHc0UnI3NnYzVEFOcFVpTW14?=
 =?utf-8?B?OEpTVVNMWFpkeVhsUmhpSHRRWXVvQ1JBZjU0M2xnUVgzbkhDcjQvZnhaWHc4?=
 =?utf-8?B?Q1ZPZnVNY2pZazR5RkZ3YWNEb2tVZ0tmblhETks5T253OFFLNDdNaHNIdVJh?=
 =?utf-8?B?c0duQjJmeW8rRytrdnRSTVlLaG1xa2lHKzhQU3M2eTRFTHB6bWlQSFR1MzFi?=
 =?utf-8?B?Z0JhanVJZlB5REJHb2N3WTI0YTBTcWRUNjNPK0VXWVpveWpvNHVWSlZ5YkFv?=
 =?utf-8?B?UFBJQUhycXZxNnFTRUo1eE0vMlFOZlV5akdTaTY3Uy9wQkpEUFNDNFNNOWFk?=
 =?utf-8?Q?jamlePP9/FjeAF9AMq69Ku0UNf+HT96PD6xKp7XnTkGiN?=
X-MS-Exchange-AntiSpam-MessageData-1: T/fRoNEIhUeHtA==
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 429366d1-1b39-41ee-1f08-08defebb2e79
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 13:01:42.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pv7BDOUKahllQrgxTFMFFQLh8HBBnRzhjROtGqbc7ypDnxf5qZNmogJAHmkih0784nz54Bn4Lpgypg0ZKaepiyIJUWYY2lTVJIdeYUPTSaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10626
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Aug 2026 13:01:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10301

Hi Robert,

On 8/20/26 12:52 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    almost certainly a dumb question but was perusing the top-level docs
> Makefile and read at the bottom:
> 
> 
> # Catch-all target: route all unknown targets to Sphinx using the new
> # "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
> %:
>          $(SOURCEDIR)/set_versions.py
>          @$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
> 
>    it's unclear to me what the point of $(O) is if it's supposed to be
> a "shortcut" for $(SPHINXOPTS) when they're both incorporated in that
> build command. can someone clarify what is going on here?
> 

Introducing commit from 6 years ago doesn't clarify anything, so, no.

It's there, doesn't hurt and we don't know if it's used, so... /me 
shrugs. We could remove the misleading comment though.

Cheers,
Quentin

