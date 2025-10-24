Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEA8CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:02:11 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.56])
 by mx.groups.io with SMTP id smtpd.web10.13426.1761318121926579752
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=EFeebXtc;
 spf=pass (domain: cherry.de, ip: 52.101.69.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXL+1Qt4auMUyo5mVd8mnlfm15OJaeyM6CbbygWGWW177Hecw7G9Dj/1efMgUNtiHdk/YzJrhsJM9fjzoySXEAPRsK6Y00G7G3BywGKs2beURDLkjjRv1Ne8YBzLXKo8vlTju7Yy5YC9sLA08Bff0oMHELp+RnlmGXg09D+3u3tNhjyguLAzQpB50Pr8MWriB0FT5fM9I2lq4THJJRREF9ZqH5vL3RZp5ieizSZNK9A7vuub/7eQrUwhgsSxobCSZ/myWzZnkV5LreBOPLh/uM1IH9EJhw9pZTD+KZVsuv6h5FI/OQnKArFy3oPNPJsbQmhREgECc2QD2g+Ue6qiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iy/FcW8uzC75SmXingo5ayzsmreKM62S8inEqWeKNfs=;
 b=SCExbWTMlqGTemrSpjUG3Onx33kjRXTqz39nxbI6Hm8e+xgtxg3cf6Rxr/GlGkAAd1PE6W1oTOMMyLf9F+Y+bMeky8r9KBC+r5n3353scJOI6rbxcTK2FOzJOf6VYw5461XCbgXKOtBPC0iR3o8HTzEllMp+yQl3MfBZkxywP/RsVurSDTLg/VlNubA1mlqHHjp4YHyEBR3nAUPy2Z56ChYueZatFF8Q6Lq3y5gFNf/aoY02gUNKLqc5z30zoL3T8g7SXSuyMJh7EV1Cys/cC2blu15ThWzwxiXErbw6GwrmQNWW0z5+eEVGQRoQO0g+w1D9z2NH+beuYvclCAQCRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy/FcW8uzC75SmXingo5ayzsmreKM62S8inEqWeKNfs=;
 b=EFeebXtcUc3OCp16ol2Erq9X9fCZGz+xGsQLE9e0w+wTdM1RDzqgnzAIyyx5kIzDLfIwlMyvns4+fmaNW6xL/KUyMdW2t4sY9YHiRBn69ssu9zvxFtPOup+3bVMh8t95NyV2rCTng8lZhQ6fjmzH7vGIkeA1c7x8fuBw/ZhM/vY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA6PR04MB11806.eurprd04.prod.outlook.com (2603:10a6:102:526::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:01:59 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:01:58 +0000
Message-ID: <ffe40861-b3aa-43e2-a7dd-c3cd51e4c1e9@cherry.de>
Date: Fri, 24 Oct 2025 17:01:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 01/16] ref-manual/qa-checks.rst: drop
 var-undefined
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
 <20251024-release-note-5-3-second-hunk-v2-1-d15dabc095d0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-1-d15dabc095d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA6PR04MB11806:EE_
X-MS-Office365-Filtering-Correlation-Id: a860b5ef-5a5f-40b3-8ae6-08de130e47c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RXZVVnIzRXI2T1kyalAveDVCZkJyeWtCUnlwb2hMYWpxdVF6citHRDBLQndD?=
 =?utf-8?B?bXNSVFdldFVHSnh4eTQ2bXRaTFBJdTZ6SElPNXpESS9RcGhzR292WEFPcXhP?=
 =?utf-8?B?cUYyUHI0aitaa0JDdmNaVlhyendVbGVmT3JTR25zSzRERWl1ZmNnUGJSYk1j?=
 =?utf-8?B?a2x6QU43OE5raUdESTIybVo3R0xBaW9qdStoYUpCZU9YUjQvTzNSS01rZ25o?=
 =?utf-8?B?TEZOb3lBeG0wOFJIbGhUV0wzVk1IQzBSWTVjQmUyNzJDclY3WmN1bnhXZkU0?=
 =?utf-8?B?bzhBZTUwcCtjVi9kQWRCbkpLbm1KRWtvY3h6ZjlYY1JJNmxya2t6VzJ1azdy?=
 =?utf-8?B?aUdpck4vQUQyY3BaMWIvOW5vOWNFMzhkOFNFb3A1QkpJODBsRnI0UDhGS0cv?=
 =?utf-8?B?Wm1CMnVKdHUwQjFQZjQrMjJBSzZVaXNWWXQ4ZXhnUUd2YWlVNHhYKzYrUVBQ?=
 =?utf-8?B?SHZ6bk5JUFNEQjlSTlBseWNERklXb2VCNThQclJ5cjNsbzlMNnFJUzdGZ3Az?=
 =?utf-8?B?MWtXNXZ6cXZnYkJ3QS9VUGVrcDVwWmRFVW9TUFFNUC9zQUUvWnpTdDNGb3RT?=
 =?utf-8?B?QmZuSzJDQnhOL0FDM3FsemZOTTQ2c1ZLM1FYRlJ0bkJoYmgvdWpLeERXbERY?=
 =?utf-8?B?R0pzekFsRDhNN1ozUUpPRmI0NEZLdkpDTWpvWWplK1lGRlJQaUJleFpZUFdy?=
 =?utf-8?B?RERvMVFtbXJ1OFh5UURudlZGVzluRUtHT3RqQW4vNXVnSitncGY5MUQ5QmRo?=
 =?utf-8?B?TU1jRjcwZ0hYVytUMUZ1dlV6enlVSTRUbUE3NTBraGpMMXdzaGhmTU1ZNGxR?=
 =?utf-8?B?SVowb3BPUjlLc1Z2QUtPcVMzNjlHRUQ4cG1NUzdWanM3UjlNdkxhUlpPTS9a?=
 =?utf-8?B?S0VpUGlwUzUzcnRNYVhxU0EyMjNMKzF4d0RNcGRyckVZZHRCU0QwTUoyQzE3?=
 =?utf-8?B?TFBUWDJpeVJ1aXRYaHlZNXFZMXVYSUlMdW1mZWNDZGZaZHd0QkpYVUxLV0dY?=
 =?utf-8?B?SmFvcEJwdlRicTZwVDI0RlVjN2g4M3o3dVdCWmtzV0ZwN2RyZkx1MHNjQzk4?=
 =?utf-8?B?WGZBamR1Vkdkb3dneTdvTDBvMXlidkx6NGdVaDdqUzNBd20wTDdXcVFnR3Rp?=
 =?utf-8?B?WldKbTlGTlJ2aGpSaUszRGthNjF4RmhjaVY5c0JyL0F0NEhHUGpWL1I0L1I2?=
 =?utf-8?B?RTZaak04LythNjZ4TXBROGUzRk1WZ2tENk5Hd1JMT2hSSXBqYVhvSGpVd0wv?=
 =?utf-8?B?WEZnMlJ1RFdRT1JnaE83dUkwTmxlVFU3NkFvOGY0UDVoQm81Q3B2L0dNTVU5?=
 =?utf-8?B?eHdySDF4blFFdkRjb29zamdpSVpFSmtyb0lZOS9iTGhSNk5LTWF6elRDUEE5?=
 =?utf-8?B?bVJPQVlyM1Rhckt4bHZ2QTlwMmpZNlRFbUV5RGhNQ29mSlpYbnF6aWJ6dWJz?=
 =?utf-8?B?MW5zRjhjVWtYN2FKeHRBVEI5b3p0dDhuN0luV0VrQU5HQ2k5WEQ4RW1hR0tu?=
 =?utf-8?B?VzgvOFFqZEJqcURSL0J1RzZyU3J1UXZIR010TkRISmxvS3c4L1lMd3FOZEZX?=
 =?utf-8?B?Z0M1MWpxTXVDNG5taVZZeE91WHYwdFUxNG9SQlJnSk5rQjljYWQ2ZWltelk4?=
 =?utf-8?B?RTVMQk1sai9WdHBPK2lVazY4YmxPRzdRejdodXd3YlZjemhjVVVFcmtzTGZy?=
 =?utf-8?B?dnlheUxHOGpIbk1UUHZZdjJvQ243RUcwcGJVTExmL2lSK1lRa3pNYldsZldq?=
 =?utf-8?B?U2tBdkpOcHVkRnZlelV4RVFMYWlmQUNNVCtjT05yVTdVYmJIMXVnM2M1eitp?=
 =?utf-8?B?SmpacE5RNzRQVHdpT21NenQxQmc5QjFqNUY5Q3A1WG5Dc3FGMExTSzFnTnVw?=
 =?utf-8?B?NGJucjl3ZHFHd285d1B6eG1lQWdYMzY1L01jbjBvU2I3MUVVbjZzbFdBWEtz?=
 =?utf-8?Q?LViCbgNAzw3/OhrBijFNF6j9QyXES7GO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V3Vha1lyeVlPV3lFR0RJT3U3ZEZ3M25icGFRdzVBRE5lRXNpZFUvNXJvZ0Zo?=
 =?utf-8?B?L0NtUDlPQWMrODhsQU45MUl3TEFUWDhTNTJCSTFWOTRITEFYelVBbEN4U1Zv?=
 =?utf-8?B?S3U4c3pGSnNScnJxUE5yNXBzd1h1UzVPdmU4QlR2NFdQQm9KNXJ5Z2h5QzJj?=
 =?utf-8?B?TTdLVFdocjArQ1g1QkZSeFhORFc1ZFg1VTlIVy9NcVRDZ0dsaTZBb2ZpNDNN?=
 =?utf-8?B?YVlpUjJ6UytMbFBva083Unc4K242WHpETkVPOG5uRFpJa2kvbnVMbGlDWUVT?=
 =?utf-8?B?dEtxNnVIeTVQOTRLWTFRQkkxZW9uZmc3djBnZytLb3lHN2tuMm9VZXUvUnQ2?=
 =?utf-8?B?TEdMSFErVWVrU0t5ZEFtQkRJTGtnZE5laFZRSGtocVI3WkJIVkdSZ1FIVEJu?=
 =?utf-8?B?S1ptbFZrZFJCU0dKc3R4eG9VV3drVkhpNWFwQjMxZlMzWnBDVW0xR2h1MVRv?=
 =?utf-8?B?SngzRTZiNjF4a05IZ3dKYVprV1Z0VCtQL2tBQXpWQTFHelhEUW50bGlaT09I?=
 =?utf-8?B?RDdGUzM4Y3lGaktrenBLb2xxVGdqcWs3cmxFWXhIcXAxR3VXVkc3SzZsditi?=
 =?utf-8?B?M01Ya0Q0QUdGOXB5RjQzK0hGZ3pVRG5maWZFMy9GMTFINEtYNHhTakVDMzBL?=
 =?utf-8?B?ek4xU1NQQkZTcWx6MmRNOWF1QzNYbHg2akU3c0gzcllMTXB5eFVlSTRoRXF3?=
 =?utf-8?B?UDM3QXExSjhBdlYyWDlGSGs0b2FqZGdmM2RnWUo4dXhUU3MvVmtQYjE0TE9O?=
 =?utf-8?B?UWpTcjR2WjlQeW5yaHFpVkZNZTVnQWdtTEhJWXRFTmpUVHlKS05Xa1FZaGFm?=
 =?utf-8?B?TDVWZldMRTVYamI4bTVkZnRlUU45ZWxpT2N0NzA2c2pzUlhpY1ZKNDVnZ2tS?=
 =?utf-8?B?cHhmRlFmYTg0Z1JwMWFsNnBnY014ZjAzNWNYSk1VeWQxbGg2bEVERnc0clJi?=
 =?utf-8?B?YnRuQkpMUUlmS0t1Vlc3eFc3emkxY2ZyL2J2MXBuT3pzNmpmZ2hnbFBDVHh2?=
 =?utf-8?B?WXpLOHhhZ0p1NU9TclkrZy8xaUxCTVVuUW5ZdW5OSkhIVFR2bU91Y2JzcVBW?=
 =?utf-8?B?N3JySG93TWdKYkdKMXdJRFRWZURSODBBaVJoejlNRzNycENmZFZJdWswRXdD?=
 =?utf-8?B?MFE1WVZ0RTJmNkcvN1p5cFFiR3krT3FCVU01VEpUSThWaFErOWpiVExVSTk0?=
 =?utf-8?B?b3ZWNThvNGFEcUl3NHU3dStzNnV5a0NRVGJOV0EvWTgzL01QN2JTaHpnNVJi?=
 =?utf-8?B?WVlqM244QzBaUndDS3IrcEUzY3BHSUk5SVNEVHNNSGljMUM3WGhLQy9QYUJF?=
 =?utf-8?B?eU9BV3d0eGYxV2h3SFFZZmRwRVczNXpsc2ttaEVtNUhnZkNWanBDdm5uZEhC?=
 =?utf-8?B?TjY5bzFOejNyRWU0VGV2NE1kWDhBWDdNalVKai9sN04wUVRpdWhQSVVqZTh4?=
 =?utf-8?B?dHJVUUhGaGgxaGc2R1JvS3NFUVNyR0R1eGdGOHkxSDY4ZTRYcTBwNE9iM1BO?=
 =?utf-8?B?YnFjSkxUb3lCNW5jK2cxNG5kVGZPb0w4YkpVcHd4aFBqSEhNY2lEazY1aXNX?=
 =?utf-8?B?VVFXZ0d3WlorUlB6YVJsK29tNXVNQVFXc2NPc2VRWlpPY0djbGhKU3k3Z2FT?=
 =?utf-8?B?K2puVmNZN3huZUtYT0J0bzV6MFUwZi9wUnE0WFJtYkpCZ2xaZzhLWjVtbU9q?=
 =?utf-8?B?RE5SenJwZG1QUUhrRFBVVkNpa0FFMm0wN1AyS3ArS05tTXJLZU9zVkRDUlJR?=
 =?utf-8?B?bE1SOXF1amhUN2xzNXhWVnY0amQ2QWNRM1gxOHJtNXVVN3ZnQTRkem5NaEp0?=
 =?utf-8?B?UjNWQmZpME1ydHEzVkF2RGs5SzcyYVNOM0dyVlg2VFcxL1p6dmVrbDA5Q3Vv?=
 =?utf-8?B?VWduUmR6RnVuZUpxbXQ5TXdsd0pNWGk4MUt5RXVINDhLbkdDZHBmendhUG1J?=
 =?utf-8?B?Y3BTa2U5NVVxTWVzdEs3ZDBnU2ZNUVpYcllBNEd6SlJnMTZmbnUvbTFnVHo1?=
 =?utf-8?B?WE5hZHZPS3NOR3ZZRU1rUnlOd2NXdmNNMHJsK2RXZmxvM0lGRk4wRjcxay9p?=
 =?utf-8?B?Ykxyem9PRktKdWpIcllyUmlDRkw2NVF2WFc1dTMxVXQ4K25NbWc5U09hS0hP?=
 =?utf-8?B?TC9TZDNRMWs4MjNBYVY1ZmhjUVd0VHMzbEhUdGZwUEx3eFpaTGtkRXVZRTA5?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a860b5ef-5a5f-40b3-8ae6-08de130e47c4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:01:58.9366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SN1IYRvrUZRj4ULMdmZCAiQIkGsOpwfOaO8oaMr1luftQpf3g1UTJ0r+0n29jXRp/PgU9XvcTAqZnZBcwl2VJaRsURdFpt9pBKnJvVGJU4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11806
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:02:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7823

Hi Antonin,

On 10/24/25 10:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Drop the var-undefined after it was dropped in OE-Core cb69d7eba802
> ("package: Drop var-undefined QA check").
> 

Indeed,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

