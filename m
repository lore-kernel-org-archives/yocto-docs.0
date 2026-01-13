Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E028CD2D111
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:24:52 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59901.1768314283818885360
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GHb6KJWN;
 spf=pass (domain: cherry.de, ip: 40.107.159.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgj2JjxvSiwKYWNSHC/6acWUS/ksoUz4M55qeEKfUUrtf/spSgFrUYVa4roa6iEtG1CaVcsSbRCgHC7oG8SAlE0gOJddDQruWeuAQi1gtwP7311PDhfWkyebSNTvSmaWf2Cmjvq3DC+0LHioLl6l26xL8QxbrYsoOXAgOeAkbk6H3z+PeQbNDrdQlkIkYievjs6vur1JiBYahmaBa0LrWELN1kgbY2o2smE6XWVyGLXq/wK3nort9+1fzuJ+yBiiPMCXm/H2Pv5AknE/uKwCiD8NTesVsRDDbdUUJ6z7eY3sRqthGMUdAbX3byoQrJWHzCXQ9M4j0BNwFpxFfh/U2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PubL2e8mGqewPFX3boI+AF19ZYqpy1LZid7MwlD+pdg=;
 b=VClUvZR31jlh98PQ2SVdIPmQcD/vNzI2YlY8a25pwXY/42mddOIGnwchvlZKE5gv2UnqZLcwctkV1qg+5EnZCbdch5eiADQtcQc6OAbPCcYcfUzKv95iAAKfOjoWNmWuJp+4zF65KIsLv7C1ajNTHoUqGyxbgqwOi27d1KiKBUw2HQEvnJ3sOQaQ5sAzB9Jk2ImrPj3xuVGJ9jEDj7/ltxvTqdZ1hAgMeYjs3dAqbBBGKMsYVBxdfEQnzvT3cOa74lYeTnrj2rFSUAThF8vmYfQb6RobJvebQWFF/uYfSLXiKjLuw5dk0ZKPQPjbnK20PSvd44Ru8H64tnxH0lGPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PubL2e8mGqewPFX3boI+AF19ZYqpy1LZid7MwlD+pdg=;
 b=GHb6KJWN8Lb5guY1rH2RKLpvxDv03DHrAcn2ZVyirge5YTRBwAc/VpYHFABMIE7JoXiM4Xcn1F+zX+pvt13Kwu4k8jrhi0ss3MktDlbI0wRleKVM9WS6FEC5hBmoV1AaTN9KqL0m4qlCXmhm4Klb5BYIbWrt6FqeRxc7g0EH7ZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB11956.eurprd04.prod.outlook.com (2603:10a6:800:31f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:24:38 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:24:38 +0000
Message-ID: <f39cb2ef-8632-418f-a5c4-1dc7f65d7207@cherry.de>
Date: Tue, 13 Jan 2026 15:24:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 31/53] test-manual/runtime-testing.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-31-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-31-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB11956:EE_
X-MS-Office365-Filtering-Correlation-Id: 2085b27a-c6ef-4da2-5e74-08de52af7bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cVk5aGUwTWk3MlRYTGJSejdabGZIS0UwYkhoRFBKMEcvZldIMnFob3Jkb25F?=
 =?utf-8?B?cjNJMldNbSt2aUovT0daRFR0aExJWm5teFV1MzlkYnZWUlJHcXpnRG9qWGRX?=
 =?utf-8?B?TDZrSVhsd3FiRjgvWFR0Y2ZKY0lWbHZkS3VXdWJiNDdzSWFFT28ra3JLTVVk?=
 =?utf-8?B?M2NseCtVZVJPMXJWaXNBYXh4YnZWZkZ0ZUZCbmFUUGJ2R01RVVRLejk0eDZh?=
 =?utf-8?B?VzkvVjBQTW5oalFLMHloK1orcWJhSjdRa3ppMjBTREVWNlBVMy96ZGZuR2lG?=
 =?utf-8?B?aHdVRVpmaFAzMEw5YzZHS3hLRXROaE1xOWt1cisvZW9yQjZTdjMzVk9QVW55?=
 =?utf-8?B?N2s4anN2OXB4S3R2NHJPbkIzdXZQYWh3ajdiNFVpUUh0WEN0WXVCNWY3TTlZ?=
 =?utf-8?B?emljOW5RRzRMQzkzc0tLMjdUQmkxeEhuWGdhTDI3MG1FZElLWURGcWNFTCtj?=
 =?utf-8?B?Sm8rbkQyeDJiNGhiUzVaRVhvUDRDMis3enJBR2NYbjA1eTlmQWdOcWVMZlN5?=
 =?utf-8?B?NENxejNWMC9mRG5oOWRkeWMzV1VVdzhod1lrRXhYeit2SDhjbHMwcnZOZ0x2?=
 =?utf-8?B?dGNJb2o3a0JwRFIyc2U4c0E1QkZTN2hZZ1FEZEFuUFduRU5ONnQyQ01Ya0xL?=
 =?utf-8?B?Um16d25BTU4zRXpFUFpoLzg0YndWRjZFY3dWR2gwTWxuY0xPeW1WMUg0T3lN?=
 =?utf-8?B?SnU2QU9LeVpIOGdocFozZ3kvclRhMVBQbTRzVVNFUVVlaytaVUVGcm5KbU1J?=
 =?utf-8?B?MlA3anpzVU5udVpRRmRxem5LNGRCVWpjOS9ZcmhYbjNoWkt1UGZudXJ3TXBR?=
 =?utf-8?B?WlhmZkFhZ0RVRGYyb04wZ3dxeTRMZTkyMU9RVVBBTUJmRjRpTWk1K2pGbmZy?=
 =?utf-8?B?WTNPRjhNazVnTlhBUjZvdDJyZ21QZ0Erd0ZaSkJYaVdHS1g2Y2N1ZWFHbmRw?=
 =?utf-8?B?M2w3L1JVZUtJdVpBUzlkaEZMUHczR2VvRXovUHA4WW9nWUZCSDR0WUs5eTJz?=
 =?utf-8?B?R2laN1d0cEFiYjJCN1VCMENIaXZBcTFaNDd1N014dFhwYndzU2VlU0RrYW1F?=
 =?utf-8?B?Snk0YmVsZFFwTTNqTnNNYXdVRDNSK0kyL1JkTXN0K1VmZHYxK2hWS1greUVT?=
 =?utf-8?B?QXZXM3FFQWRHS2QxOVYxZUZBMkdOY3hrQjZFMkxCcS80UjVIVWxPYndsMlpS?=
 =?utf-8?B?Znlqc0d2T2lpNi82MGpGSEJqQWoybGtvOHFieStQZzlXSzYrSTBmQTEvTXN2?=
 =?utf-8?B?bGZHbE9Yc3pUTFowRXM2RFdxV2NoTUtZU2ZuWHRUakdpUDhzeFdNUVFMbmxU?=
 =?utf-8?B?QkMwRnZSaHRQTUkvb1MrdE1GUWNrVHVEa3Bma0RoNytxNytWUHBhdkJsaUNz?=
 =?utf-8?B?anZycC83VEVWWWdWdzVLam0wL0liVEp5VzVYMDJZaWRtV1JkQXA4OFJ2TkdS?=
 =?utf-8?B?UGwxRE4yd2pvZ3FZZnAwa0xmaVhKVFZPZHREaHJ1Q3JBV2xpWUUxQ091MklB?=
 =?utf-8?B?TXdTT0RJckk0cG5hNkxSaTY5TzR6dmJyT0E5RGZ2QUZXWW15WmRwQzV2Q256?=
 =?utf-8?B?UXpVSXNiSmJPUW9sWEJqVWJQajFOa1pEdXB5di9yenRYZlBPM0N6UGpZQWFh?=
 =?utf-8?B?UFdKM1pMZFFScTg5NVBZSGNNYmdZOWVDYjRuT1h3ZkdzS3hjWWo4eVl5ZThj?=
 =?utf-8?B?amw0b3NIWm1yQ1RJQWp3ZWQ4cHFxOWRlU2tkOGhTazRISTg5WVBGVWpRUVlx?=
 =?utf-8?B?K3Znazk4dVFmakRWQmt2QjZEemtUMjEvVEZ2dGJFeTdZQ1N5ZUs4WlBnL3o0?=
 =?utf-8?B?QnlLa05vVWVhN0wyaFE2MjRTVTZxSGhsVjlZMHJlRC9MbXhBdHg2Z3o3Nm1O?=
 =?utf-8?B?L2JkTnZvVGRVM2lzb3NJK0ZUV1hiOXY0L2E0NjFIRC8rT05IeU1KYVN1TDV5?=
 =?utf-8?Q?/LdLU9mihCf5+kH6YxtbGgZ2QNdOrrt3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bFZoeGlDcU92Q1dJOW5CNC9kTmtlYm1ZWHZrZHY0Z1FwU0g3anBuZnJpdm94?=
 =?utf-8?B?UmpZaGh0bzEybUtHaWdLRERiSklIV0Zvb0pMS3I3am54NXpVTFlLWEdhT2p2?=
 =?utf-8?B?cDRpTksxOFZLdlJ2dk9HeU9PZWY3d2JrYXFxYWp1bW9RKzZvNmc0MmNZV2pI?=
 =?utf-8?B?S2o1U0Q3eGpPTVUwaUowMHlUUHUweEtWWklOWXRLekg1SStwdDdRazNIM09C?=
 =?utf-8?B?NVBmQTFoclhMMlJYdFFIR1VVeTc3YkhKWXo2dHF6bHdFa2pTSGFjaThXMTZ4?=
 =?utf-8?B?SFdFUnNKR3pWcjdVbEgxaGtDelRTS2cxSHhzTGZFQVhiaGk0eWRLbEFYTXJx?=
 =?utf-8?B?eTlvUWhFOFdXeURFeWNZZ1RUa0ZvU0daRUdyazBUWVlTNFM4R2k3Ry9IZ0Ez?=
 =?utf-8?B?WW9mSFNyb0hFcDhza0gvb290T2lJSDVlQnJHdUx4Q1ptR1J3aGtoMkVpKzNs?=
 =?utf-8?B?WEZLWU9mQllBaklRNUJaOU1DQ1JZYi9vcWpvTW1uQzhhdTJXU0lSVUxrRmJH?=
 =?utf-8?B?dkxSblBoa21zQUNsT3IzL29pd1dtRG1yUEc3QXhsQ2xndCtQY21MUWt0Y2lH?=
 =?utf-8?B?Y3dUQ2I0VGc0L0E4RlN0MlAwMkQzYnVaTDlhK2hvVDllWkxHdTA4U2hva25s?=
 =?utf-8?B?Ty9tRlV2TlFDemJFc0VvbUl1YkJpaHVPQTg2bk1VcUdhUzBJcmdiaGtBVlRB?=
 =?utf-8?B?b1JEZlAxMVBadXZiVHJVZGx0S09UMWRnb0R3L3Y0akhldFBqUHF6aFl6VDNC?=
 =?utf-8?B?bkVIZWp4Y0JvWnNidUtRb0gzcUxDN2dnOU9nL0lCZ0dKM1FYc20zNnloUFpJ?=
 =?utf-8?B?SWRjUlcvelBRYW5US1Y0MUdDNGtNQ2hmNVY5UXJDczFzVWp1eFRNTEtiakg2?=
 =?utf-8?B?QXRJamVXNlJaYmdjaXpwNllRdUdQUEhSV3dBdVNrMXNSYi9XYjJTeTdnNktt?=
 =?utf-8?B?d3ZMajhHciswZVVtbGpZUHlNU3VyUi9vaW41VVdLakRWL3NMOVZRUkw3QnA5?=
 =?utf-8?B?S0ovRXdKSC9rZjBDSnpmQ05RT0hWOHBoRlF1R0d0R29TTUk3VUFLaTl3WlZv?=
 =?utf-8?B?VFp2Tlp1SW9HMUtSZktiYTY5OTdkdS9hTHZ5cGlGeXF5WkUydWh2ZStXNDY4?=
 =?utf-8?B?dkpwakdoRnZCUVdWenpxM0tPcHVyUXYySUp3NnF0dXdObERROXJzS1NOa3Ur?=
 =?utf-8?B?Q21kTHBFbXkwT081L3YxYURHZ05mWS9GWFBjQjg0Q0poQW11KzNYTm5pcnJJ?=
 =?utf-8?B?dS82WVR5NWlocVNBMmxSYnlaUVBlMEJuNFUxYVA1TmRLRk1XcEtNZU5Nc2Jt?=
 =?utf-8?B?R3FPWWR3dlNxcmhndjBBVXdZUVVxZFZaeDVhTUlQRmRIdWVvejZIK3NOYVFz?=
 =?utf-8?B?OVYzTG0xaDNObWUzM2JyT0tTdlJRYWZlTjB6MHhGMXhkSlhhdDVGeHIrNHUv?=
 =?utf-8?B?UHRobWM5S0czZE94S1JGbW5nN0ZlUDQ3Yno2L0x2cVNqZ3dweEUzWmNuTS8y?=
 =?utf-8?B?WnZ6OUYwVHlVRTE3YnBiS3hmNzNxYm4vN3liOUxjUVBNazJJbmR4WGhma2py?=
 =?utf-8?B?a1NnaXphdG9hbWdEZ21XMWpEWFgxMk5oTjhpYUpxdnYrczd5SDZEaGQ4d1dP?=
 =?utf-8?B?VDd2SU4zUEtKVkYra3RBalA3WCtZVmU0SG9IRWp1QkMyWU9XOHI5Y3dyZ3I0?=
 =?utf-8?B?ZUJ4S0NYUURBSDA5bU9Sd08yZGhkZ0RDM2g1SE9qMXZObGxXUE1IREJCNVhq?=
 =?utf-8?B?NVdLTUV2ZS94U1FtZ1hUZmh0N01mQXN4bFZIaGVMTlZDSUFXeEZqeEp0djJh?=
 =?utf-8?B?bFlaZFMvRXVnVzA2cnNhYUE0VWFOVDBxaXVWeDFMeTJ6c2NrNUluWmJGWlR5?=
 =?utf-8?B?OVVqTjN4UGMxdENlcVFOZEFpd2k2RWFHS0pILy9DbHozQ05DRnVMckczbnIr?=
 =?utf-8?B?N0NoRjkrcHJTRE9HSlViSkIrUTFBd1BpUWlybGk4TjBVT3pQMjQ5UEl3VUlZ?=
 =?utf-8?B?Zit4K1p3Z3JTUlZzeWRwQjJ3OWE1UWg5cVBuQ0haUjZJTXprbE1oTjhCN1RM?=
 =?utf-8?B?QTlnWW1YUWwxdDNBbjVHbklpVHpING11TmhqTWd5cE1hZnpJdFZsOWZqeXVv?=
 =?utf-8?B?T0VmRjhLS0g1MTdQanBkQjZwQnZwYmhaUHg0NzdsL2ZhZ2ZQZGVkaDhWUFhm?=
 =?utf-8?B?MDhoejZMSERRcXFob3BNMFNoTlUyaDJHNUVCYUtlbUtobWJKMWZXL0JXQWkv?=
 =?utf-8?B?ZjFXNllJL0tzK1VPTE9rckZxSFY4RHEveVlhOUFHVGZDTkZFVTBCcDA4a01v?=
 =?utf-8?B?ZHE0aWY4ZnN6N1h4cHFqeXd1V1ByVDErSkhWWFB5TTVIR25xYmRzQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2085b27a-c6ef-4da2-5e74-08de52af7bed
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:24:38.6452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLUUjCG15LG3FG9Scdj6DIr800ToUPSdcMv+WJ8O+WMQo/FAVocT+G8kwKDLUGT7rfd8zqUCBcboJz4ptmKTDqVGH+XAqGUxCOcenMJYvIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11956
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:24:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8520

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove reference to the Poky repository, replace by OpenEmbedded-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

