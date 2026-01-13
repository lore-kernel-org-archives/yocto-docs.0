Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3383D2D110
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:24:12 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60162.1768314249340088863
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=G6Q7vxp/;
 spf=pass (domain: cherry.de, ip: 40.107.162.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXoCLLG2Nva/t1Z7QRGvDGfKdm2+ZzcNty0SAqaQB6c23lgKKOR0B0VPo+9HUkQHaqDaXQg5AEYhTHzyUeLLm8DDFFW0f8pVR2plMTNP0BNxTu4borlAM5IqieOoeOBW/5flioxLUAGdgOdm+5oXjfSRtyUiWPAOzEOBiHnIpleS1gTy1+XH1n+t/8LF8eR/RRPT8fccAx3v8V/d542W+QYslzZPui/0NC3rHkVzFxRspA7x6ir7pdYuNZiICvp56+saPdRiVpXNQfbIff//ipTpWSaFs021Dw210DWbgrr4KaJhTcy9j7J1eT5GdNTJHAOtXnI+1BXTbP6GTJd93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umP/oxbsGMq0tK+tbWsc3kmLmLFjpEkUTz0IV/hCd18=;
 b=dsD9P2uw3eURPIto0UQvF8z8YTTegkj4TwcEU1ReKRhihFDDxxnJ7SAfgh9gjA5MhxywTsuTcbdHSa0bREBWhCRN1Ui4fy+bsISx06HDHVkZkurO63UJF3q64+EttPPMNxgFbhThzyZQTJnXuBCoOId42Aq1HaJIi8ZEi6BTgiZ8rvQaC3+UkMCIhtRRYiONKzoWVcLRUCK02mVE8Gl83wzH5cfqjS5pSORRqGsr4/kXWOsoKjd18UbjuyIOP89qOHQpwNmeLVfUOYTzJ2uAAT68F+SyQQPIosE8BvfSlf0yjxRy6T/DM/KcT7vmSJH9UkqNNMG7tCKlGbuV97ssEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umP/oxbsGMq0tK+tbWsc3kmLmLFjpEkUTz0IV/hCd18=;
 b=G6Q7vxp/8WlrGt2zfi/jfkAKdbfszbFZcz7orBbWXjLR8uI31T3iD+6LrRcSgxwG0/WE9yOR7ExNM2WWxsH85hvzNymrshEP3oMSy9annrMZ2yC28WPXOEJWQ3QkVpHH3mvrF1z4Ja5idtw9A97/F25SJSPT2VncPBSRyATTqNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB11364.eurprd04.prod.outlook.com (2603:10a6:10:5d7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 14:24:05 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:24:05 +0000
Message-ID: <6bc7506d-a2c1-4743-9323-ccfcb0e35d02@cherry.de>
Date: Tue, 13 Jan 2026 15:24:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 30/53] sdk-manual/intro.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-30-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-30-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB11364:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9fd052-47a0-4047-3bf0-08de52af6806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QlRGUDZpSi8vQzYxZXUxODI5Mkh5Ri9XNUxzbzFqQnJHSEFWVVppaWJMRUpY?=
 =?utf-8?B?THpYbjNpTHkxSG5IVDYyQlNScXV3M0FJc0tKOWV2Zm5taDBkbGxWcW4xeE5u?=
 =?utf-8?B?QWV0eEJYMStvTHVNMTBYZzlSbGdPTnQyOFZlRDdCdHNwUjMzbnZwRVJ2ZWh1?=
 =?utf-8?B?Y1RscUZwQVIrOS9mM2pqODBzK2ljSjF4cmV6NUIzWS9WSTcxSDg2Q3dHeFdk?=
 =?utf-8?B?OG9ZSVpaOWtFckUyNFV4ZW9yaU5Rangzb2VFZEpoMis2YzV4Q3BHT21XNE1D?=
 =?utf-8?B?VVl5M0d0dlJBUnkwcm9hT3V2NmtvNUQwOVlubkFVcXZMb1BuYUc4Mk95bGF3?=
 =?utf-8?B?OXVlaXJCQ0NpaWs4MkNvaWl5WXRPZ2h6ejdWRmM3Y3J4ejBINlIzNjFmcm5l?=
 =?utf-8?B?MzhOT0hjNHNDY3FScnp4ejNmekd5a3Zib2N0NEcxMTNia1k3RjBROE5EcFRN?=
 =?utf-8?B?eUI1SFJlakR2RUxLMUcwcnJsOE0zeWgzbGRza0xKUTgxNjFsWWRhVjhJck10?=
 =?utf-8?B?eEdBYTZCcEtFbWZwcWJZVXJEWEh2OXZRL3V4Z09VNEpPZWNFZGJkSDJDSFBt?=
 =?utf-8?B?NEJNcDEvZVVaSEtUTEVPcGxHVjhCU1F0MVE3SllPMHJJWE16dWpSd0hQU1Bw?=
 =?utf-8?B?Z1ZZTXE5OFJxeGo4OEg1KzZQc0U5ZytmZ2ZMeC9LdzRXVGVVNkhkRDJ2LzQ1?=
 =?utf-8?B?Nk4rbXFDWDRiNDRuTjU5VFY3WDAvWkxzalY2OVNpOThkSWdrSnNBWjVTaFA0?=
 =?utf-8?B?dGYxL1k5QWVJbmZzclc1SlpwMU1YWWcwa2t2d29ocXVacWFwWXpmQllqcmh1?=
 =?utf-8?B?NTFzS0U2ZnQ1WWcrcFFUU2g2SUZUTFR6cmp6bys2QllDaUw3NUtWeTBRYXE4?=
 =?utf-8?B?SUNnQy9ReEZRT2xhVkFzU2oxYU9YRFY4NEZ2V3lmUzJkZ3hIU21BTnF4Ykdx?=
 =?utf-8?B?RUVRd25uaTdPcGFLMG1RWVpGT1hCSExrRk9HWmdOS0pBZXp2T2NtSDRJQk9Q?=
 =?utf-8?B?Y2ZOSmIwTldJK2loZDR3aHhVNHNya2VCR3JpaHQrZzJOdXdSdFR2VURHUWZu?=
 =?utf-8?B?ZnFBME1WcisydDJEYXkxcjJjOE5rV1FHd0JVSFRyakVqZnhzMm1UT250N1FO?=
 =?utf-8?B?aUViS1JtaUk4dDM4QjFVdUtIOW5yYjRyeHRJYVFaMUFRclpwL2dJdHpZa2p1?=
 =?utf-8?B?ZVoxQVY3WGV3VTQ1UmF1MXdCWVJqd3IvN1ZGMDZjVWY3NlgwMFo3YnJTYVV6?=
 =?utf-8?B?d2dKZFRGck1jNFpGOVV3d28xcXBrWHFsNWhISDlZWG04aVU5T0hUNnRMWS82?=
 =?utf-8?B?QjVpUG5VeWMxTE02cmdKK3V6TStyOVd3MjFQOFNVMDV2MDFscTE1TktUdlly?=
 =?utf-8?B?cldheFdkRUlMblIvNDEwbjVaSzJXM0RTYkJyK05wV1FPSXdrM3YvQ3lrWmd3?=
 =?utf-8?B?MHQ3UThkSnc5aEhIMXl2L1A5aVJiaE1zQUpkUkxMeERvTTZnaGh5Ry8yS2tD?=
 =?utf-8?B?bXk1WUVNVW1NbEFyc3ozM0pBTUlkdzM0MjBEWFR3Vy9LSU45MlZDS0x3TlZX?=
 =?utf-8?B?Q21MNHNSMFZRWFVWVTVjWWRDNG5sVDYrQzF0djE2M3V3eEtrenlJUUVrNUdI?=
 =?utf-8?B?TkRncytsclhHWDl5cnJsSmhMZDhtRUdqS3lIeVh3aGs0VzBZa2d6R2k1WjM3?=
 =?utf-8?B?cjFGSndJRyt6bEk4SlU4RFN6eEZLTkIwNUYxdHYxU1VZbFZySlhQN0loaVJw?=
 =?utf-8?B?R1NZaU42Y0RiZnNFT2crRTEyT1N1dWJMVGppWTBMZ01NU05zcWNON21sM29Z?=
 =?utf-8?B?V1QvM3NsaUZJZnI5N0h6Z29nc1F2RHJ4YVd3aDRPNWFKQWN0eWc2RzE5ZjNI?=
 =?utf-8?B?UlUxU1I3Q2hYdXVSQXpJZzhRTnpNOXVkWnhyTGNQQ2c0VGFBclFMT0prZHpJ?=
 =?utf-8?Q?7YF3yHjC9VheC9CiSmqBIQi9NhtX0rG6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1FxdjBONzdBb1JFTytjUUNaM2VCV1RESkM1aHBzdVM2TjVsT0RxUGxzci9J?=
 =?utf-8?B?cVB3MFVOZUErWmZMNXc5NEZkOWpXcHVhaEFaV0FSMXlCc1UvUjBSbWowaThU?=
 =?utf-8?B?UnhMY3QvZXJ4d0dOaFo2QjFjdmxIVlNXQzBVeXVHMlhTU1FvNzhaanhtSFp4?=
 =?utf-8?B?ZDJnQVVSUEtEZit1b3l3ODlJTkNuMmFJZ2NkU1FsNFNlV1owYnBNVG5nRlE4?=
 =?utf-8?B?K296VE5KNXdMWFlkL1UxOFJ2eXlSc3RBSWNFd0hodXI2TEY3WGFFWHBzd20x?=
 =?utf-8?B?K2oyM2V0YlE3cmNHekFFSWpxdEFRTzdNUE9saFMwcXhXSHFCT09UazZOTDN5?=
 =?utf-8?B?Z1Q1cEZGTEF5M1BPVTlnZ1BLQVhOVjQyVlAyN0VGVUlwcFBpZ29lT3Q4WGtJ?=
 =?utf-8?B?QnBlZFhWeVlGVzJUN2dKQkFNdjAxZDJtRzhGeTUwZXJlYjFXS3V3RUR1RW53?=
 =?utf-8?B?dGhPd1V6MkNwaDNpYVdrU1RtMEpNMUFHdlJZTEpoTlNuWklpWWlpL214eUpL?=
 =?utf-8?B?TGZURnlZbTJLbmg0djQ1dzU0VnpTSGJWV0tPMkJOYk52SzhkTllvNlRaTXJ1?=
 =?utf-8?B?ZyttK3g0dmMxZUF1RStjcS9PejhvZTFSd0VQd3lYZnVvelBUY2tDVjdxSDQ2?=
 =?utf-8?B?T2RCS3dVekRNd3BvTW9GeFVqTm11NjVaWTRpV3NDc1ZjQlVQRlVIU2duV2di?=
 =?utf-8?B?bVRxdnIvYmlJZzg1MFZWdlJVYnRsKzNwRkh0eHRSZmNSMGVLNmlPSkF3THNj?=
 =?utf-8?B?UXFvWUpMYWRVOEg4TUZXNkpNK01kbS92ZHk1Z3FaMitEcGNWQTlwdnl0ZldD?=
 =?utf-8?B?UkRDd0FqRWg4N3U1aFBWeStHeWxRbTRGTktaQTlReUVMcUF4WHhTeW9HcTh5?=
 =?utf-8?B?Y3lkOUR2T0FjNEptaWYxUFJJblhTM3dOa3VyNGNuVm5YVlJhZHBlZ0o1NkZH?=
 =?utf-8?B?bmliVzlYK05MNXRLbzdtMllyTXdRb1R1MmZsOExOVTN2bkt3bmUyWW1VN2xl?=
 =?utf-8?B?RkVZdklaYjhIS2U1VVMrZWlPVU5kTkRxNndkOGptTFRXd1NLcXN5WjYxaWZa?=
 =?utf-8?B?MEZOT2N0VGU5amhxUld5Mk14WmRlWThyREs5ZUdyYWZGdVdmUWd0Rnh0b2pl?=
 =?utf-8?B?MUt0Z3NZYWY0elk4THB6aDJ3dkpiMDJ3a1dCeXdKalcrelhzd2FOeTBHUHda?=
 =?utf-8?B?dzE2bStiUjRiQVc4eWtBY0ZLVmJTcTN2UjMxclpEN2RXSTExSnlUeUVqa0lP?=
 =?utf-8?B?QmlQdXc2TDV3VVpaNDR6bS9JVGNFemMvWFZEUlNCcWV5eVpsbERKck5tR1R6?=
 =?utf-8?B?Tm5OclpuZWE2TWk3SmEzQWNLOXFzdFE1cy9NQi9vaU45aTN4eUVZU3h6Qlhn?=
 =?utf-8?B?OUMwZ1hkWjQrY3Z2eFJkdCtoQlk4UDYrRVhQbldRK1lHbEFiMG4zREFXTklo?=
 =?utf-8?B?TTA1MHhYYXRWV1R1REV5YjJ2dDZubzNEZG1VWGxYc2lEZ0JTQ0lVbWVnb1Jl?=
 =?utf-8?B?aWF4ellUTXJyeG9mVVdxdjVtTDZwNGVlYlI5czVyNVJUR2VGelRyZnpSY3Rp?=
 =?utf-8?B?U2J0LzlaU0JnaklOWjMxZ1EvNnVROEVOTmZSMlh3NmpYeUpGVVJhbWVQTmV6?=
 =?utf-8?B?TnNiOUx4RlYvWEIrL3VLL1l0LzhLeUs5QUVSalFOY21BRXNpcWF4NXBZblp5?=
 =?utf-8?B?K2JLWFYycTJsN2d4S2dVZHRjU3ZudmxDcGNGS2NqSDB2amlQSGtXQ1dhZVB5?=
 =?utf-8?B?M3Z4TGhhbldQWnlFdERSdjRZSDJlWnV1UnBqQmM4b2tYMStTR3ducDdNUE9h?=
 =?utf-8?B?WGtwQzFxYno4QzFkWG53Qjl3ZVhxWUxGK2tveW5zK0t3MmI2TEFKdnlXbjZq?=
 =?utf-8?B?TUtSZHFSUUZBZjRZS2FMc25MOTlrb3pUM1k5a1VqbTAveUVEanpnNjVmR2tH?=
 =?utf-8?B?aTNlM0lrcm5VZmJYaVgyZmRTSTljVmNTSmFISWRvTm9oWTZranVpdEhkd2dG?=
 =?utf-8?B?K211NllWaWVSK3lNZWg4TzlNSEV6TUxZOGErc3IwelRFeGNZQ1dDckFMNXN2?=
 =?utf-8?B?MGVQaU0wTVlEUjJyUUw1Y3F4Uy9GbXlwNUJnMUtOYTRyN282L2FpNGRIWTE2?=
 =?utf-8?B?NXdsaGFqTHkvM3JPZVdCUk1aUVZHaWNXcnlWY2xiVVU4VDVwL2l1UnBtN3NQ?=
 =?utf-8?B?dWhYU0ZJL1REc0pBN3ZGZXVXRUR0aXhjb3FzbWRFMCthRkpHZXBWMDhqSlg2?=
 =?utf-8?B?WThqSVJzd2l2VzZCaVVCVmwvM3pVVGxDUVZQNWRYUkw4NFhIWHJkUlQrSkI3?=
 =?utf-8?B?RGRuaDlYQXVrN3ZZS0dmTytzSWFlTGkrNmlWMkZNSnJWV2ZpS1NBUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9fd052-47a0-4047-3bf0-08de52af6806
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:24:05.2630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfiqnHmCf0igVTfddIx7WG28s1rOxgrdTx+CROlmeMIOEpqENi8qqYobbaXGSlUj8hFVgKdqCEBXentBRsJozqG4t8czuCxN41BtCDDOsjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11364
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:24:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8519

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove the mention of the Poky git repository. Refer to the existing
> setup instructions.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

