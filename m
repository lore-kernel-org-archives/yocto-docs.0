Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0C2CD4F26
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 08:37:29 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16522.1782203845719540650
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 01:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=K9rVArN0;
 spf=pass (domain: cherry.de, ip: 40.107.162.4, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFZsh2YrXpmnwt5gcjdjOJAYWg1Z4fk0I3f8F/15ijLWBAlVb6rdq95MIWTabaE+HNON5PmosfwZhgbbZeC/ytD7yiB8sbIG0ScarKQqzpaVn2MNLrq6CJ/nkd+PXopqdX9vbyBwdTblA+CggLLWIRjLKzHWYLz6oIAqv3h07oWAogjihAJImfyFaRIZ/QmV5EF4AcFcCtL+iNeqOB9r8tNTUCNRp+aR2hTXi61eyEmuCNU3w4Cn/JmHRkEwbPW7hwpFM64AiuZkX5sVG0fqigD/HEnBU5mXrJyY2kMNdusfuf8O9H0gLQ8EeQ/ywakKRlRvqy8Z7I7BdZ+c/ZXZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVDgDqA5F2Q6hxqenNwUNMRfhf3r+rhw2EBUHRT1VXQ=;
 b=ceFW+EK6nyuQQhCPvNROIJYlwGmVS8OmnC7N3cWH/JeotF5upxVTmo7qcttZ06a7y82ac/asCZwt9UwPWAofWfpQO2E0sZdQqY78IcWXczeWKIJB7FYTd+byQzw/qEJzKrnSPs0c3RUuwgwyP7/66ohiE2rx2ziHo4S3e+3xOrmlQeup/1xL9iOkBF5X+eUpfloDx0JzC8oFNx6yiOW19fD2K1SUbculNoIZgC8AE/U5bqmVgx9e0szhThhtnkpht8wlGg0r5zjBN6noESFvtxk6iZLZDhukUmNyg/bo57SLKINNCM3UlvgG/xQPVMNbULlODq9z90eWPqNQFUUPHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVDgDqA5F2Q6hxqenNwUNMRfhf3r+rhw2EBUHRT1VXQ=;
 b=K9rVArN062ITAXVCaaa/B9qSG0aCVS7TmM3NV8QHPYqCABDd+wx9tednvl/qylWE19Pg2Tzn2nysD5a6piu19ZbVxBSR8mKrEoI2eVR4CSNof2T7BVnI22L8DBre9gZFpAPYMvQMmn/akpLMhTVW040ggx9Kw+W576A7WwgD93s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GVXPR04MB11018.eurprd04.prod.outlook.com (2603:10a6:150:224::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 08:37:17 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 08:37:17 +0000
Message-ID: <438be488-f905-4a1d-8f85-606c89c2a249@cherry.de>
Date: Tue, 23 Jun 2026 10:37:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/build-docs-container: add debian 11
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260623-add-debian-11-container-v1-1-8cfcf8572ee9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260623-add-debian-11-container-v1-1-8cfcf8572ee9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GVXPR04MB11018:EE_
X-MS-Office365-Filtering-Correlation-Id: 043c2a71-c178-4b4c-9261-08ded102a1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	aTFAA45tTDLT2k/9Y0vvq0uQa1jluUWc5G7dFmAIkO3LUUridEIVrgIiW48sw1DondJ2L05n22yafW+vI71T3ZceisfLT5fzR91ppMY4HYT8S//E16qoKgw9wCRecAAx5/MwuEL/tw1Zb4eMsxCcAGONTDSvQjntPTzlM9/uUGT4/xD0NMftbPSvBdpYri2Ty36Nupr+aBaW2ExhvhXTw2TmwlRiVm9iv/z6wrq+NVDha0poBqf4AScmopeaoBPJssZHaIj5/h+vvySrxIzGPI9kErnFYsknYD6DdjCpHgjoXp1DjvW758SkdrHOxdWv4Pr+T5rtSCcTTux4+orY+asue3imGmzmD4gfvPBeDpCJfCjjw11aHDKoERgGjfYovLUC1pl0kYLuRcKOWNDBKVx9dZBjhX9IMKbIUTS2bEAJGB1jFQQ1EFhHmNxaEgVUViG7B6E2qn3EQbIyhDpTaHXDUrEP8oNFOSyLMuFUh6mgNK4H2bofILRc+ZkcG6zN+RDRCrrsLj3Wf3o3JDXe2miQ7MNFj27xFrzB8J/yCza3g88RtUIO9Fi/dKEqnMg64AW0z0dLazj7SfeRjj7JS8truKTtcbv1swF+rFMocvKibd3CHOq/Pi49Zde+v9SBw/gFixW1z942irB0tuiWmv2Ke4H6JFg7RfD6WF1v9gg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnJHWXh0Z0hGMDFqeVlZbDBLaUYwNkZKM1l0aGl3Q2FLaFpYUkRpQ2ROejVp?=
 =?utf-8?B?Y2d6QUpISXExQjJGcTBOQjJHcHZ5UnJxSEVrLy8zOGFGcUVsSUpaU3NvY3JC?=
 =?utf-8?B?WDZiSVZ6UnpBdXFKM3kxdVB1ZkVHbnJ4VmYzMDlVRFMyMFA1OHZJU3dSdkI2?=
 =?utf-8?B?ZWNFbXo4NEJ3RVBNa2g5bklxTlZqNy9Ga3BwTmVzZnlqQXlGL081VzRWYVpB?=
 =?utf-8?B?QnNkVCtFWkRIbzZBQlIrNUkxQ0h2OEM2aXZVQklzRjdpdTJQazVuWGg0N3Zw?=
 =?utf-8?B?UHp6L2JoSVdrdS9CREVnZXdsRDZ3U2dua2hFMHBWcFhDazAxTEYzR09FWFFn?=
 =?utf-8?B?MlpidGw4alQxTU8reWdnU0lUaUl5N2hIdElHWjdyd093eG5UbzN0UHUxbVU1?=
 =?utf-8?B?NUFBcVlDR0RsbExQZlB4UEpxVkhYLzlDSGNTL2M4T3ljRHJtVE5wemRQcHNs?=
 =?utf-8?B?d0lvMGtqSVVhOE42a2ZVT0hVNTlHcVVhdjc4L0lXZVE2Skp5eE1IelBNSmZx?=
 =?utf-8?B?TkpMdGhnUmFXWWNiT0FDeWdPUC9kOTNTRHozaXI4T2grRUN1OFFDTmYrc0lU?=
 =?utf-8?B?TkhLMldrSjExZVlNZUhHVTM5UTNFa3h0L0owVjBKQjBsdFBMWExjMG1XRDNv?=
 =?utf-8?B?MUVHMFZQRjNnLzRXUWZVaE5oRVVWMTNzK1JCR2MwOHVIUWhHTlY2azNzc09o?=
 =?utf-8?B?NzlCMG45TStLV0FvY2d1a2Y0UndMOFZNM3ludWYveERFQVN1U3VObDd5NnBE?=
 =?utf-8?B?OHRpdmZycFBWeVJYNDJ4VmVaRzF4N2JzYkxiZDJHMUx4MkhyQzhOd2xTSUJQ?=
 =?utf-8?B?dXp0SWxYNUNjNmp0dks2WGpMVk5UZTJYdGtjUWRZOElORmR5MnhUZ01RcktY?=
 =?utf-8?B?TlRoVDBQU2lHa0NrOWx5WlVsdHdKSXdZK1lTb2RFMU1iaWRPYTIxaEpaOGxq?=
 =?utf-8?B?TzJYTW9icDlONXJ2NUdNUjJmR0loeThrSHN1VkJFakZKdUV6bWRVWUIxRlcx?=
 =?utf-8?B?UnQvbHU3bzVWMEJnWjVNSjMyS1RlM0tMckJ0NW1vUzFaSVpPek9keFpIVWwv?=
 =?utf-8?B?b1JVQUtoaUthdEhwMXlXMjhNbUNVUGRxTXpiaG8yN3I5MmRZU2dtdE5sZnZF?=
 =?utf-8?B?YWx0WjdaTDV5bkJvSVk3WGdMRW9YK0VkTTNaREoyMDlRM2pKU3dTU1h0bmxI?=
 =?utf-8?B?VS9IVHNmNll0SGZnbFdYYWFCd0s5cVMxelFwTWNvUkFuREFWNGV4TU9WVDAw?=
 =?utf-8?B?RG9IaXpWWHdqam53UHp6c3c3S0p3bEl3ZnhvZ0NQNnZOUVpGVVAwOStKM3pt?=
 =?utf-8?B?eU9Wb0ZraG5UUTBFd3o3Y0NQcitvblhVQnR0ZmN4Z3g3dks2a2xnaEMyOWI0?=
 =?utf-8?B?MzNwU2QrNm5DWWtLK1kvaUVPam9uSkpuS2k4UHJSTnFLbGRqeFJrdjdhRUJN?=
 =?utf-8?B?VDRDdCtFa3NPYzNCR0VWVFludkRDTFhNbk9hOWVoRlVhSlZaOGo3YXBTODVX?=
 =?utf-8?B?cUsvMjE4ME1HT2pQSUpteWdVVDN3UUI1NnRpSFduRS9uWjZwalNGWnlsaUQz?=
 =?utf-8?B?cmN2OXZHcGcreTlCM1J3KytDU1QwSUtUNGtzcnJWdEhMY1h5eDRvcjJ1REpN?=
 =?utf-8?B?QnFOOHFydW5EVXJXR3BsMWRES1lrdlYxTWwwaEN4Mno3WkZTZ09GRi9VUFor?=
 =?utf-8?B?d1RMalJGalNsVFI2eWpKMHM0dEtRblNqWjhTemFqZHIrVDB1b08rNkdzaTVk?=
 =?utf-8?B?Q3hKQTh5YmNMTEdqRTFkTUV1cENtMjdmanVaenZaNEFXTWVhN1VuRmNEa0Ex?=
 =?utf-8?B?UzFpTDhPRzhXeHJtQ0NpK3FKNHVSL1U4YjduYnZnaWp2VGorcHlqYmpEZm53?=
 =?utf-8?B?THVFdWdVOEcrMnByOENkby85UGQwUGxjcVZTOTdZU2N6SDdjTFZhVlIydWU3?=
 =?utf-8?B?cjNBTjNFa3dWSjlFVThobHVDVm9ydUFxYmNMUjFtVkt5NlNNVStDUk1mdlZ4?=
 =?utf-8?B?SjJFUmF2VWs3TmxReGFQN2J2WnByN1BidE0zMll2b3praGZndGc0TlFpb05s?=
 =?utf-8?B?VndyNENWamVaTmpXUk5NalMwQW1CQTRHZ1NBaW9uSTUvTm15b0g4TG0rL0JH?=
 =?utf-8?B?UkIxeGpIb2IwaTlIV3RZWG45VnNpMEQ2eTFrNEJIRnhqZ1ZsZTBsRUJlK0h6?=
 =?utf-8?B?VG8zRnZOTW5KeXhYUmNPamx2ZUltSGUvZWJjZFNidUZZU1d3YU5FUlQ3RHQ4?=
 =?utf-8?B?UmphektJN2p1ZU55YlR4L2RzakZaZ25GT2l2Zk5WLzNJMEFaTUJhMHNZZXFB?=
 =?utf-8?B?c0dUc2RYZURHeldzL0w2a0VkNkF0aTJwd0hHR3ltT3poajNtQnkydz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 043c2a71-c178-4b4c-9261-08ded102a1bc
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 08:37:16.9194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5GKYQlsUj32v2xry3znEi9uyynlNSmRRHCx/jDpxLQ7TsEtTvcWYP9vgLk29rANfeT/gcT5dCB0GpSMTsgvB6Kn9Z9Zygi9O2VSkrVjsTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11018
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Jun 2026 08:37:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9838

Hi Antonin,

On 6/23/26 9:43 AM, Antonin Godard wrote:
> We removed the python3-saneyaml host dependency which was the blocker
> for building the docs with Debian 11 here. Add Debian 11 to this list.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Building html, epub and latexpdf, the build passes (didn't check the 
output), so:

Tested-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

