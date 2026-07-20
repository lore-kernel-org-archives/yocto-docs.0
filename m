Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12897C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:12 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.877.1784563208449063311
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 09:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LA/8rqdc;
 spf=pass (domain: cherry.de, ip: 40.107.162.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwoScidrA843lOFbh0oAlGyKQGrM157D/XNT4O8MHvEQUmYBEfAtSCRb4K4EMKeljx5TOFV+1zrE+dNLsNAyxiJ0/2X6Z8JQoZBE8n0Y0DfjQiaBRmlcC3kWAJiDjbVLjG2nJi8ZvB/TZX7r8jT9UrUEBkUbSs06FPJm9AAolz/ajlNaQqutc6x/kFDuIVGBrOO2ozyCg2nchJiKymp5fEDzI5PJQTMFwbWtuw69wCI4SA6nDdZPAO9oU2EL5MwUj/6jsafJCLeI7VJ897rmA9YuhJgB484peKN2S34NigfNrGOJg/Is+dVXnUbVa42kjVbfg5UdWKcDimHCXRnjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhAp5J3MBGBzNv6kFzEMFCqD2brYMNjRKjLSDdw0gN4=;
 b=wMhA5jBM+gy6Ou6MELdnSZ0xAufYRA9xfX7z+P+K4gh6HoUDSOPxTLfRSDz2s7iPCVoVhEPOxCqneLfga6sSdhuQRt74Ilaf1JPhaSBeMVFt7UszdgqU23CBOprem/VzzcydCccRAltOAxkQpRqeCc3Sj5MaxqUfAOxOh8MH9FKY5ZoEjVqL0q2+2MUsf3VygaYY2cVh/kNZFY+afmEhGLqTHO50bg9aP2ndvWDSYGFoMoeaGzlnPR8FliSvcdC9FvPinuXXKV0clR2B/Fi29b1Vv8RO9Q8uAMIFUMi6/CX6aURyXdgsiuu1cn57kLvabqjogvwE+PE1VRLctHqeJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhAp5J3MBGBzNv6kFzEMFCqD2brYMNjRKjLSDdw0gN4=;
 b=LA/8rqdc5RSZ3j5fJQscHxFGiBU4y4vZ5C3vPXv/h1xaLskzmeH6ni7GT93VRSZzOT9tBnrqZded6j6zl/N5N7cmnoRKHnUiCvX+uMsVpe3AlF310NmAXRbLnAVRAfvDM/8w2/R5eMWQI20lYWbXejkpurff/BZB4EUlV2p/SGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AMVPR04MB12625.eurprd04.prod.outlook.com (2603:10a6:20b:774::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:00:03 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 16:00:03 +0000
Message-ID: <142fc0f8-08e6-4ee7-a20a-29b1bd44a2ce@cherry.de>
Date: Mon, 20 Jul 2026 18:00:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 2/4] ref-manual/variables.rst: remove flags from
 variable names
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260716-gen-doc-links-intersphinx-v2-0-83cb3aef6ff6@bootlin.com>
 <20260716-gen-doc-links-intersphinx-v2-2-83cb3aef6ff6@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260716-gen-doc-links-intersphinx-v2-2-83cb3aef6ff6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AMVPR04MB12625:EE_
X-MS-Office365-Filtering-Correlation-Id: 6934b3f0-e6b8-49ed-937e-08dee677f5bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	i+UVZFrXSqmMscW7iAhQVDwTnlLDpFOC6FMhwvTImiZ29vn/964SHXYi46JrMxZ2F8IMjy+5W0nrwLfx89HVcPcXw+gj5BcuY5Axulo7yK2ggZGQW3MEpLZ2HYsPztxSWA51RN+NW53hvwtjH93tyF6ElSKCe/NV78cT58yG3jnjX3d6Yvnk9wUZrpceXOVX4QFCPXYXgLobLq1vBFxgeVsMwPCRSJiBvbgvYK4SmuzcI5674Quw3pIxhbFEO47Myf/S7mT8+TJDaM8dcbGT5COHMONLFOJr9xpX6Qgeb3sQoAsRAZLn1KI26JUoJouwnwOsECaDXH4rGYX66NVqzI5SfSBYISdvs5bvV3UUwRwB9Nz6X/4WnogAQ/yHZCoG/uqZyBXMIWf/u5G3a4/ZmpaetbAUslvXZjQlO00fmIIbFAcJU25cLBRe8ZNZFq5Pe/olPnIK3PM9yS1uLi8LjFjXLpPCHrKcyIwmxGHDKbDiCESGDgZywjETJvyxGWFGQ6YiqQ7aXAz5YOW08rYxOuYd8VMIaPRBNZRrTPefpjJVYAMne8Q2DkuiGC4jlly9S/Zq7G3oEgCr96YjgeHn3ZmUI9oLmz32ezLlxQ1N4SB9QOCiE3c916jtLshNvRseibEoouQ/xdpGH1++on0lw7XsJDhKSM5rLtRsPakMlxI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VmM4L1hVejV1eTNsYW1OaTlsb1JlaDEzQmJPOTJvdjJWczkwMzMvcCtYZEJB?=
 =?utf-8?B?dkNXZHNoQ2dWSkhGOStwMXVkSUh4T0VpYjZXMURDRGxESWtZZVUvTkFhRk9w?=
 =?utf-8?B?L0tKQTRVMnpqNUhEQmhLbndMazNscXZCb2xaZHVHTVppdHNSMVk2VDlSVm1h?=
 =?utf-8?B?eEdOL1Fxa3cwbWFyb05wMUwraEVGZ0Y3UEttbUNiNTRIMXZJUGY0VWdSZXFQ?=
 =?utf-8?B?WFMrTEFHU1Jrem85R3RUdW1iQ251MVNUbm1PSDM5VjNFc1R5RTdQejJOcnpx?=
 =?utf-8?B?MEI4RlF2NjcvKzFDY3V4c1E2R1VBZFBGbFBCb1F1RElteXBlNDZMYmJweTFn?=
 =?utf-8?B?NjRTRFA4bWVQYy92RWtaRXBDU21VNXh5MFYyV1lXeUZrVjY5d3hFSnArK0Nj?=
 =?utf-8?B?OTQzOFBBUUo3TXB2b0E1MHNGUDMzVW9MVlh0eG84c1l1WlB5dTlIZXJ5ZDhR?=
 =?utf-8?B?MXVGak4zekNGSHppZ3dpTjg0b05MQndFRnRSeUNBbjRsb1Qyd1FRS3RhSzVB?=
 =?utf-8?B?c3lxOS9mdkk2RmY5ZjVVNWdKc0h3ZHVCVDFHV2trWXE5S2ZtUWVhR01PRDlL?=
 =?utf-8?B?UjdUSG8rbXV4ckhIMnp5WTcxbGo0VEZOam5OUnpzOEswdHB3OG9IM3pQMm4x?=
 =?utf-8?B?bHUxRWt3c0I2MStudGdZdHNWd3hXYmlZUzdxRS9Uaks3UzVFYkxLYyt2eE5L?=
 =?utf-8?B?UHJrc3FnMXViMkhvTG1Mbk84SHpuL1ZQbGg5cC84djBNNDU5Q2NxZktrUk5Z?=
 =?utf-8?B?NlE5M0t4WE53MDlPR1dLUFJtQVc1a1NqaHduV0VyV3ZTeGs5T0sxM2ltbEdN?=
 =?utf-8?B?OW1qN3EyRlVIbHQ5WFFVbEJ6LzhGdm1TT05ORmxtTi9nUXBDeGIvV21nVlpv?=
 =?utf-8?B?RjVBNFd2ZTFxNStjKzBQMG5KNjdPUk5QcEQ3WHBselFBWnVNZEdmQk03M1FR?=
 =?utf-8?B?K0V4ekZYNWtUMnBHcndmV2kwdlZ0N1htMUpqZVRGd2tXU2Erc2NXQjdCNEV5?=
 =?utf-8?B?OVdKZHNTRGtCRGJLN3lDcjROSklQaGZaTnh4RWRNd05aM1N2UWd4aEs5SHZu?=
 =?utf-8?B?VnE3K0plQVlGM1grWGhoTEJlbzk2K2RuNEJkN3R4U1dTZnRBRHJjRWRpcmZC?=
 =?utf-8?B?NTZXZGVibmI2QlNhNTZRMHdSK1FxS09wcjQ4RGJPSzFHd2pmQm9Qei82Qk9S?=
 =?utf-8?B?NHp5S01rd0VOaEdUWmp3TktaYjJibElwemtBSHFaR05RTGF6Um5kSFpaK2Ft?=
 =?utf-8?B?MEJDRzgzd250K1NCRGg5ZDZSWXd0ZlBrZkx0cWl2VGFvbjV5aDFaK3FmK3g4?=
 =?utf-8?B?akpaYUQwenludksrL1lleExhL0RkV2pxeTRZRzNTcjNoUW5lYy8veHIzcEVB?=
 =?utf-8?B?ejA3Sk13Um1ZRHM3V2FSellGOUQwOGU5YkFRWVN1QkZuYUxmc0tYUjJEV0dK?=
 =?utf-8?B?OTdnYmpBYjFXSkFDWGhaWTAyaENiMHgxR0QxazVPNDlMeDltalQzNzRNL1M3?=
 =?utf-8?B?WlhtRDkvdGEvdHB2Zlpkc2FxQ0F0cEJ3Rk1mOEpQRWZaanRZN0ZOOHl2ek5P?=
 =?utf-8?B?bW9Bd2ZObnYwakgrUEdqYW1SSUp2RXloUmw3cUU1WkFQNFlmZTh3Q1dTdEgv?=
 =?utf-8?B?SDdUUElLNFNIK0hWc2ZJWUQxbjRNU1V4OHVCdEtRc29mdXgzbHpESUhBLzhI?=
 =?utf-8?B?dnNxNnFOKzdOdU9KcVBHU1M2eTdvc3R4bnR2U2RnMEU0NlVVWExIdzYxNjBP?=
 =?utf-8?B?eHBPMmtyRXF0R1RJZU02Q21aYXFjYU1QY0thMlc3ckJJdlBTcFhzSTVEN294?=
 =?utf-8?B?MlpiWEQ1Q0dKS3d5b0ZVRm9hZGxaU294MHBNTXg4bXNJVUVvbE9DUVl3R1Fv?=
 =?utf-8?B?dXVWSWJDNTVPenlyNTdVZm5zMFRoUjUzQjZ5Q0tFZWorNkhmOFhKS2hYdUZ2?=
 =?utf-8?B?SDVHbExORlh2b1hNVG9HWm5Gc2VJeHdNclc0U0tzSDVSR1BmMnZPTXZFaFUw?=
 =?utf-8?B?bVEwNWhxVjlJZnVPMVR1cUREZUFZa0FwNFJWSVA3a2hXYjdFYkJUMkcxTndD?=
 =?utf-8?B?MWZqeGJCRUVvblkwRFYrK01EbC9pTlBlSVAwWEJuNHVpdVZ6Vjd5bXBoZ1hE?=
 =?utf-8?B?WlBzVDAxSSs3UFhYZkdUa3pabEZucW1hdnVtY01HUTBDVnd3bi9ybDl6OWh1?=
 =?utf-8?B?Q1B5ZzY5NW1HRWVyMU5KR0lsUVhYRkpRaDBFUXN0VEY3TGs4SGZISlBXdEd4?=
 =?utf-8?B?QWpVQndCWk5LdTNhdVVqN0tOcjExclRuQ2ZuZzFBM1hFc3J4eTRuOElrclB3?=
 =?utf-8?B?L0lVM1FBS282WEZoMm5Wc3lHeFZqeGJVazY3dGVpUVRGV0xPanlSUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6934b3f0-e6b8-49ed-937e-08dee677f5bb
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:00:03.3017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngAzExmXSRLD3RMOYPzgJGwVei+Pk9PXkTttYB8tXiEHD5+cAHEJGpj7ZcKquZUJdy8+21osRzzgad71AVk6Ig0tiUhrb4n0K5NmwkIJIVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR04MB12625
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jul 2026 16:00:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10099

Hi Antonin,

On 7/16/26 2:18 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove the flag from the variable name as this is not going to be
> supported to generate links for OE-Core.
> 

The example in the variable descriptions make it clear it's a varflag 
mechanism that is being used, so this diff here is enough and should not 
incur confusion, so:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

