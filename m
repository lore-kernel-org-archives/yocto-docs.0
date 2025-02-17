Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73B1C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 12:17:09 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.76])
 by mx.groups.io with SMTP id smtpd.web11.49790.1739794627104829120
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 04:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QjYwEi39;
 spf=pass (domain: cherry.de, ip: 40.107.249.76, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIzMiTgGcJ4KnGlDquHa1Mw7rrr7+nEXR7sBTStXxRVBtlwoxpZTCm9CwvwWqcivrrJaISExGlx6Gias99FO3UR2IEk7KH90YdmAfCHxkrOjTfX+KkGYKCq7soWf5kSIew0SoLdS+bg53m1uNzjX3gS1+D9z4gvyhSccIyk3zhoUbWxHbOIMbsVPAaPFJH6sduRc5l1VV/pzZg9D8Bo8eKuPX7hYO2R5izFToNp5f97CCLbHbIx2G6tdnXN/drXqlW+WNKbWFz4CGySClN4jnWUjfWPFXcffGgZwYR22M7AyurOP6HdcP2dPcOpTrZI4EJHsaTpH2uwtVRYLT+WQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSwaXPEPpkLtCUhd0yLL6hRneZKyxmfiJGrtnYwGLsE=;
 b=elAYgl5DxeWPO1G9evnIwMsKKChJOiFfb9Ynz33U/ajckvmYM7PDQQCYNjwDpQWJAAwrrVMSVQoT6KbFhqXYXmqSAm/MdFIx/FbJk7IucFFkdwRMPuza62xuExfIWxdcfRjdnc47IdrSuokBUNB6irj+ICgpUe6hDBlBtVqBEn7r0J/5jkbpq8Lbw9H0Dx2MeEO1/9y1Y/jMpQAsDHbIaBrafY+uwKdFecYltzA8w+3uKdkjaNLxMOWwIRcPH52qlGTD8ZzJf8gbhOpIQAIzatLDsFFRTuvtHUbNyH2i/35fd+YlnPKdVhuRPh+ojKw/vYDxd30KHXi+wU3iXFpcxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSwaXPEPpkLtCUhd0yLL6hRneZKyxmfiJGrtnYwGLsE=;
 b=QjYwEi39mUVb7pI64uU/2KfjxXUno55sLDuzQZYmVY0G5vndNrJXu6If7ySgYI5rA/08noEuZtq+gCSquq3inHers6bIniDSGfT1B4U4i5YXMfgaWBhygfjhPTAVVOcN5i2S71ca7Lmh58uskGdG4sB3F5LPU7/CklCtf9xH/ZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB8PR04MB6793.eurprd04.prod.outlook.com (2603:10a6:10:11a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 12:17:04 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 12:17:04 +0000
Message-ID: <4d5b0347-f39e-47ba-901c-22c7611630c5@cherry.de>
Date: Mon, 17 Feb 2025 13:17:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 5/6] dev-manual/multiconfig: improve the current
 doc
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Hatle <mark.hatle@kernel.crashing.org>
References: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
 <20250213-multiconfig-doc-v2-5-f2bd35115cb7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250213-multiconfig-doc-v2-5-f2bd35115cb7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB8PR04MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ba0675-13f9-4ae0-a0d5-08dd4f4cfd1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a3RJWUxVc0lveHM4Y09xUEZoNVFsRUlFSnQ0cWNDam1uZDE0ZW1sQmx6TGNT?=
 =?utf-8?B?azhDOE03dk1RaW53NjNycDJ2dmRPbjVLcVIwcFl1Q2FGNnM5bTJBUGFwaklr?=
 =?utf-8?B?WUgwWEp4TmFYa0tydUZ6M0ZoTWFVNlFYb0pZL0g5eklicThET2JndFpaZVo4?=
 =?utf-8?B?a3p1OXlwT0ViZm9YeVdRUTN2WlI1VE1lWG02cE14dzhpaFdIY2cwSkRjRyti?=
 =?utf-8?B?d1lHZEpOTk5TckZNNzduS2NBMXJ0VE1BT3Rram1YdWtHd1l1TWg1akxvTzI0?=
 =?utf-8?B?V2RyUWVJK1NTOEFjUm0xZWhUaExJamhhcEFDUndYS2FpdjlQMDFWQ1dieFhY?=
 =?utf-8?B?alQ1Y2JsaExpdmc3NkR3cVM4OEpJeGRzUk9tRFBUY2pwZ3pydEtHWU5vUzhF?=
 =?utf-8?B?Wi9Nd1RrcUZ6b21melB5TFdpVnRrSENzM0tsQ3RINjg2TlpJeFZmL2dnTlNk?=
 =?utf-8?B?NlFhK1lxN2RPNFVtZldOaSs0UUFtV09FeCt5dU8zeHNBcTJOenJSS2RHeHVo?=
 =?utf-8?B?UUsvY0tTdG5PYnBIUytDYktCUk9HbEptVXJsWDJ4WUJyRGVkU3g2M0lmaWRR?=
 =?utf-8?B?UUVwbmlLYk9BYk5kS1pTbHRyU2ZIUk1qZzdTNmIvanFYKzNRd0ZGM0tPQ0FU?=
 =?utf-8?B?K1FKbU5xekJwV005aCtMUjRGTVBha2dSNlJYOTkrZmpGaTQ2U3ordUc3d3Uw?=
 =?utf-8?B?YjRUUE53QlRDMUh0dGhNY2JRSy9BN09WUUN6djhjNDBPNk5KMTB3a0ttS3Vv?=
 =?utf-8?B?QVRCNjNkOGdVUU84SFp0TVhZaWc4YktuMFhWM1hTY3M5YzNxNnZDVGs4NDFQ?=
 =?utf-8?B?anVBTUlFSThzczBuS1R6czZnUXRUOTh0TUtrL2pXUjRabGdqalZxUWtmaHB4?=
 =?utf-8?B?R3gzUXZLVmcrYTByWTB5NG9kVlM1QjZHRkRjR0Q2QW85RmZUZ2d3RFpTTVA5?=
 =?utf-8?B?ZUw3a1JPYjdGOE80Q2JUU1kwY2NRalkvbkMxZTRyVHhGMytDZ2ZRWDRsOVdY?=
 =?utf-8?B?Zk9kSnBYaXRFWlBEUFBzdDFBbTczMHdodXBVbHFJeEc0UnhMckhGR2lUNHlD?=
 =?utf-8?B?Q1loVHJUWk0zbmFXNi9YL0YyU1A4VFRtdkgxdWJ1K3N2V3RIZUtwVWJqQ1VN?=
 =?utf-8?B?NWc0bkVZNHRoV2FibmpEYlltUEppVTNPQ0F5b3ZINTVyZ21DTE4rVmlKUEhY?=
 =?utf-8?B?RUdpRndtci91aFFlOE5qRmwvMXFhbjZSK0k5dHBRVjA5Nit2T0llY1dtV2c3?=
 =?utf-8?B?alVQUUp1bWhibFdtY2syNjJnd3o0eGRrejJLMktVMUdJMldnb3JaYkVjUDJG?=
 =?utf-8?B?TmhNMGNiWFhkMi9xYVdWbER1c3dRM0pRWkhVU2RhV1JSQ29wMncvZHdaUFFH?=
 =?utf-8?B?OWx3V0pzTWlKakoxOWIvUjB5MGpmbHAyNzE5bEV2SUVyK0FuRk1TRUwxQVE5?=
 =?utf-8?B?ZkZQcTUvVlJGTWZONGkvcVFBdWRObGEzcjhhSVRKeXBMQ1ErSUdxRjZKelQ2?=
 =?utf-8?B?bTdIcDNtc3BXdGVmL2xUN0F5Z29kMXhpYWZ4QklGSFZ6RktKTUFPL2RPT2p6?=
 =?utf-8?B?S0NkTWpKdExkV0tOWUUycGlaWk5zTjd0MjZRN3ZMSWFjeWhUUzZRb2JNeXdN?=
 =?utf-8?B?bXVxZ2E1SktOQUc5MUpITldaVGxnOTZwRlJhVkhVcTluRm1PMHB1dFVFaUtE?=
 =?utf-8?B?U0I0T3M0bW1KZWZNMHZlY3Z0N1NTVmp5Rjg1YitwWkpBdFdQYm1xSUxhTjNN?=
 =?utf-8?B?UGtqbXNsSXlScmM2Vy9uMUw2ekpzVEpXcnlvb1lPbnNMSDdQTTY4cjFzZ0V4?=
 =?utf-8?B?b3AvUkd2SGxIckNRSVp2UT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THdqQjR0MHE4NkRyQm9GRCtGNGllUGRHSklEeVpiWCsvdm94SHpBemxDRjdZ?=
 =?utf-8?B?cXhPOE9tYlNqWVFzdHZJZ1VWRzc4Q3gwK2lYdDFabXJMNHZvdm5ob0ZoTUwx?=
 =?utf-8?B?WUJnSktQWmtVRUN1UldScTBSZWdpMGJwaUdKVXkrWE9qdHRVaHQ4TGhHc1RH?=
 =?utf-8?B?QWNWeUxENHBqcVFnbWlKRGh4U0RqN2RxcXl2TUZDSEpGdmtxbEhrcklYdytZ?=
 =?utf-8?B?TVRvUjVlMm1WNkVsVTJ2OTNhNUViejM2SnhPTG1Wd2NnaFJqMU8yZE5zYlJE?=
 =?utf-8?B?YmpOMkEyNmNkajlXdTl2ME5icDVBMTR2eDBQWmViUWVqZGpIb1BvdkxQSHRO?=
 =?utf-8?B?REtQYXJNUzduWUlxOHV5RVVZa21HNUNkZ1B1cWhHaW16RHRvWThoQTBEb3pH?=
 =?utf-8?B?MWc3eTMrN0NpaXhlOFUxUFlBeXlDS21mSlRjSVRPT21SaitzMHQwNi9PRnNk?=
 =?utf-8?B?b2ZXTmZrN2dLc3VjVWZUbGI1U3lPeE1WSi8wOFdkNEd2OVRBcWdwL3BSemtz?=
 =?utf-8?B?cjIrSFNCV2hYRkJsZU92ME1tUzlrME0zRW5oenNvQW5iZU5Bdncxb0xQcVd3?=
 =?utf-8?B?Rkl5NkFSaXc1VllwQ1ZqdlBSOVFtcTgxWWs2NmJDWnJwQjdZdStDcVZJb1J1?=
 =?utf-8?B?V1ZWaUVGNDlQbjZvSlMrRDY4VE5ZVi9NU0I3WWtOSnlDL2tyWDQyd1pBOE5G?=
 =?utf-8?B?QWQ3aGRlM2lmSURycVpwRUlpWU42Umh3K1FGNUlmc0ExV2tRaUUvOHNhc2ov?=
 =?utf-8?B?MFhoOG00dzEycU1UREVXTU1hVU85YURTR25VaTVtd1RBcDFHQjZmTHZlQjNN?=
 =?utf-8?B?RDFqUjQxcHpqbUFEMG1xK3dBWVVFbU8rbUZHeDAydTFwR2hjdWp6anhnZG0z?=
 =?utf-8?B?bVpHNDRQNDZFU3JTQ00vaWJzVkxJa2o3cFNmNGN2WFYzY2Q3dHBTZFQ4eXYr?=
 =?utf-8?B?aWpBeWM2SFBKUExhVUpwVGNRblpYa1pJWjVJS281QU4zSHN5MFpKL08yeUJ2?=
 =?utf-8?B?dmlIaWdtckJhTFBUb2hPdmIxbmJSelNWN2RWdmk3WTFNZlZFTWJURWxkeUZv?=
 =?utf-8?B?ZjFmdysvQW1NZGRydUpjZGRGdGxFNGxDY3VxbW9IZmtQd0NZajVUUlBMU09s?=
 =?utf-8?B?c05SMFBNaHlybzRPdDlGNmlxRlZRQStyemVaekpPc3dLWWw0aDBpYWRBZmhD?=
 =?utf-8?B?ZlI3U3BVdkg3SWhkNFFXVFU2SzQ2S1dQeU5scC94MVFoa2w4YUYydmthNjNB?=
 =?utf-8?B?RDZvdHFQYUR4ckFZZVFwMzN5K0Y5NXMwdjZsQTl5bkQ4VzZxNlBIdHNZSHNE?=
 =?utf-8?B?bjl2VGU0OGNkWlBYaUtMN1d0elBWVGJ6UnAxYVdJdnJpc3Z2RWMveFB2cG5W?=
 =?utf-8?B?b1RlcHZkWnlpRXlHNk5jNStWMUpWbXRzMnZqQTFQcWtja0hZZm92WWZ5NWVV?=
 =?utf-8?B?U3NYQ085WmNMa2JJMDFFcWtnSVRSNFVRMERuM2xnSGdpQmp6RlVhRFVzcVJ6?=
 =?utf-8?B?WlFxa0VEWFpZSXBTdUtjSStRZG02OVF6TitPei9uUHg2SExwWXh4NGhVOWhZ?=
 =?utf-8?B?KzF4RTZ0SGpFT0xINGpINy8rY2NBclRDOTc0WXFIdlovcWdtTHN3ZHhrMzZQ?=
 =?utf-8?B?OTJhODFHQ1N0OVVaZ04zRTNrTGdwMC9idVc2aUdLdU1vaHVuT1JRRTVVODZn?=
 =?utf-8?B?UXJaUldhT3FqUk1qWDM5ZndOcUhIU1Z3b3Y4ejdBOUJHb1luQWhKMWZYQVRv?=
 =?utf-8?B?aSt1dDIzNlJLcGFZcGtBazhxMG9OQTRNSVVndmZrNmNKZGtPSEFDNDJ2MXE4?=
 =?utf-8?B?M2QxbEoyeVBVODdZWEx3dlZ6d29RbmdXVzJqZjRvYXZ2MmZnZURVOEk5YW8r?=
 =?utf-8?B?WWRwdEJESzIzd0kzdTJMd2M1Y2pxRkdUZWR2OHhkeFhmU1g5UkxqcTBSRWZI?=
 =?utf-8?B?MWo2WUZsbVVWR0czZnk1YjBEY0JFbzB4OHl1b3lZOFI4RDM3dVZKaFM1L2J2?=
 =?utf-8?B?OTBDMW5HYnVSQ1dqREJya1lSU0lxSDZkMWREblIyaEd2TVVablFBdmFGamxl?=
 =?utf-8?B?c2ZHdlRuTTdWaGZpbWcxTDFFQlQ0dHRrSElwbG9uWEJyUUhBUGs4TEY5dFky?=
 =?utf-8?B?anNYS2hLVGlNakVxOVRDaVB0Y2kveXh5SnE5RldpekVFSjdmUk1rcXFMaEFn?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ba0675-13f9-4ae0-a0d5-08dd4f4cfd1b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:17:04.3765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lX+XMv05BKX4RXBUTUN9UdSdUuk2gBGLDdx84xqx0t9yx/tnnaoEgowLyKOCTOHqHStMLkvyywgb65UpxdnAsx7luhHjBi8RIuY2oCOaiwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6793
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 12:17:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6386

Hi Antonin,

On 2/13/25 9:23 AM, Antonin Godard via lists.yoctoproject.org wrote:
> After the suggestions from Mark Hatle on the list
> (https://lists.yoctoproject.org/g/docs/topic/110487932), rewrite the
> introduction to multiconfig with the following changes:
> 
> - Move the part of overriding TMPDIR or not to a note.
> - Use BB_CURRENT_MC in the example.
> - Various additions of references & improved formatting.
> 
> Suggested-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Though I would recommend to just strongly recommend having separate 
TMPDIR instead of trying to explain what a valid usecase for a common 
TMPDIR would be?

Thanks!
Quentin

