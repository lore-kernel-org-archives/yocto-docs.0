Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E067FD132BE
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 12:55:42 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.86])
 by mx.groups.io with SMTP id smtpd.web11.56708.1730724937373455071
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 04:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=i/QtXC4c;
 spf=pass (domain: cherry.de, ip: 40.107.20.86, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guHARZowRtqpDuw9GB0/wh9BhNkdtbhaCFbmp0o1UNvMAZU6WYg9l4vgYbwxNFXTpI8kN4A+wkOdB6nppQqMd0OW5NcnBwixXOltRQm2HkO48QaG1qFdLJ7jM5O77lIzHUAEfk9ZWU4ZeX7OXEq1yoys2Um2kENckppk50jxaNgtxWCqo2LHluS3OxH9OiB1y2ldPTXEpJrzKN7HclULR4ijeuENXRqQKKgFYeMwILVLln9x7iiFYHXFL7TeqPI6CZXEYSyIS6nL8OhLAekNsb30AZzpW43TlzfMRRYJmJjOtPRKP4YtSVKGEBgjD7ye/mruHHruGnDKHhdBner8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0401Z0vG18hDXGd/Cz6b55gdreJClijOzZ2EFE3mRQ=;
 b=GTw6knh89IlEdjQyGNXeCemo6bwGr57oz4+rXPkae3LJdvruhIWkaMuQQkRRehdkZck5QIR9sP/w1loAcez3szp0pG5v/qkVVjSHF5Vguv0AL974vLpFmUn9+rB/xLMfb/heq+C0vZFl6eje01icPqx3XMC2pj5acgAtt6KnqHXXWCyMuT+jX+L9krqIvmKpiO8CgWDsStQ46LPPFaJY4y0Ti6VkHsNWgmyMChvB0lGIivZPAX5dPpafws5IX1ytHHzmPbwQxwJ0TSOu6A6ofpuEfGcXLoMjKy4x0dngf7w9I7Ik68hBB/a+8R72mnHIajAfQaKxnX7hCbjNor/Yjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0401Z0vG18hDXGd/Cz6b55gdreJClijOzZ2EFE3mRQ=;
 b=i/QtXC4cZ9ubZbEJrVAbBW1j0Ce1LNsTkXq1sZzL7W2cw8x/Ge9lZB5Nyz+710ETuU8cRSsq0jTH5Utn+Wi9ps6UV1eEHG3+yyCLDhg983R+Q+El78fqeSJUx9Tk6OYw56G2SNnylsY0pjmUkMpJRduQWVqbqDuShU/CsmqzoIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8330.eurprd04.prod.outlook.com (2603:10a6:10:241::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 12:55:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 12:55:32 +0000
Message-ID: <c329c77d-b5cc-4a28-a345-ac4261a70d3c@cherry.de>
Date: Mon, 4 Nov 2024 13:55:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] conf.py: rename :cve: role to :cve_nist:
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Stephan <jstephan@baylibre.com>
References: <20241104-new-cve-role-v1-1-4d2c6efa364a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241104-new-cve-role-v1-1-4d2c6efa364a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2db90a-9419-4896-ac2a-08dcfccff7e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3ZSNmF2UTIxazVQaUYxcEV5czlVSGg0WHBMc1hockRhQlhsUzZrQUI2QjFQ?=
 =?utf-8?B?SHQvU1lrVlFuL1lJNVk1ZDgra1NETTBUWWtZUzNwcmlweENXb0g0aGYwSFhZ?=
 =?utf-8?B?dXdMMVFPN3I5YTA3YzNFVUVXejkxbFVIN0kwUVpZT3NWM0prOU16RFRPN2pm?=
 =?utf-8?B?TUprS2N6UUh3bHZ0ZkNkVXVyVGgxY3hNcEFPLythQjVEZG96SitDTGlsVTZw?=
 =?utf-8?B?SUhlS08wa0VxVnF0eXZGVndvaUVNb0VuUmlUT3R3cFZvNHNtNEdXemEwN2Uv?=
 =?utf-8?B?bEkycGM4ZU9MSkdnK2F0LzJUYzg2VGtnRXByRmUwRE8vMjVUNXhNQkUxb3Ba?=
 =?utf-8?B?ZmdZd3ROMk9xK3Z4VVd2OUVjYThOSElSZTdjaU9MSkJBNlZiOUpMVkNyZEth?=
 =?utf-8?B?dE90NjVZeFRoQ2NVeDd1aURBU0M4YnhlajdXMWgwc2RNMFVWWTFUUlE5c0FP?=
 =?utf-8?B?eGVEYkV2TFFyUXBJbHlTeXhHWVpqc1daTlUwVkEvLzVWUERad0Zqallxc21k?=
 =?utf-8?B?RzNhWHdGTEhQd2oxc3MzTlFyRGhUREhaVGlNRmlXZ3VYV1F4ckhkcFZRdkRa?=
 =?utf-8?B?TXN1dktDVTFnbU5QQ2MrQ2pzMDRpMUE3RG93T2hIVW9WR1J1MDZGa0Mzemdy?=
 =?utf-8?B?ckg2Q25UcitPZTdCN1YzWFlkK29TeG4wUkxFZlBQaEs0QmMzaXM0SkNwY1dt?=
 =?utf-8?B?aThPTmxJc0NpWWc5ci9LcE5lck1Va2FiYS9hODd3L1RBcFVmcW5zNTdmcDZY?=
 =?utf-8?B?ZDhVT2paU2lKTGRYY2ZLeU1qRmhIMks2UTYzS3oxS2t4MTZjY1hqRzZNRkFX?=
 =?utf-8?B?eCtwZXdDb0ExRGhtSCsvRWZmUGVRREFrYWxGbjlmbi9ReDZjZGwrNXJ2L3pp?=
 =?utf-8?B?M3NOYVVNNHB0ZEFnWnVDeW0rZzB5ZkdramowV2hJTlVaY1JWSE9UdzgxUzlw?=
 =?utf-8?B?STZiblFwYkZZQlZnL2lQMWt3NXdnRjhtZEkvME84RkxsOEtBR1owdDV1QjZD?=
 =?utf-8?B?M3BvblNmVEZIaEdkMUlSWFdScW9WUC95VHhZaCtkUTByVHVZZ2pMcUFMRHBF?=
 =?utf-8?B?NHRJWHp3d2tTUCt2UjhpU0svRlZYRWptbExHSFAzcVlRVHU3b2lZNHl2THhN?=
 =?utf-8?B?UEFzMWdYM2NJMk5Ia2dpSEE0OEt6NXEzRUNyVDFrZjZMT3dERkozb1hSb201?=
 =?utf-8?B?dzFmWkg1U1Y4NGNzR0dRVWtKSFNIUlR3emtoV0FEbDAyQjBlN3ViSVRUV2RQ?=
 =?utf-8?B?clErL3d0WEVPSUZWZjM1M3BQT3E0Y05zdzEwNS8zT0NYMEdvb1U4cm0xQ3A4?=
 =?utf-8?B?dE15WGJ6aCtlTCtjTENZekJtUEFOM0hCNnRWcVoxY3hraWVldlc0VlowMk0x?=
 =?utf-8?B?MDRUODZoMVJoL09xUXpxTGVYdXdCSHpQS2NIV0V4MHRiZHlkd0x1TFZtRGl6?=
 =?utf-8?B?MTRXdUszYnBYY0wvREszUGYxQjdoWG1TMTYzNnFHRDVaSm8wZVoyd0JMSWdy?=
 =?utf-8?B?alA0eGhtNEN3REM4aWpVZ1hKME5Hb3Q0aVNWd3g0ajEzQlZqMVFzNkNmWEI4?=
 =?utf-8?B?VUdRMzVwYjA4WThJenRwdEEwQ2ZUQWFKRllmbUxkS2w3S0xZZHlES3RBQTU5?=
 =?utf-8?B?WExGY043SVZTT1JYdUxVak1ib3hJM3FwNG9ZWmxaUE9QSVBTcHBQdGpNMXRG?=
 =?utf-8?Q?Q0K0vhqbn0pYvhZbctfk?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WmhUN3lKUWVEcDFjaDcwR0UvR0wwMGQwK1VBVVVkU1ZYdWtGYmdUS2hhVXdU?=
 =?utf-8?B?d0R3blFIMnNhTEdSckxxNjZvVUxvV05EQ1d3Z3pCSjFZbWdEckp4a3RkY0tt?=
 =?utf-8?B?WGtsUWtjU0QwMS9JWE94SWRJNE9TRGZ0QmFLVExCV1lYUW4yNGkwd1haUjZT?=
 =?utf-8?B?eTl3YmU5UzNUNGZNNE1vaFFpVVQ2T3d2YzhVaFlIc1JtbFV6TUVKRTN3SUo2?=
 =?utf-8?B?emlFUTZJZnMwaGtKakhGSi9LbEpGanQyZjdlVmdnU3dva1lTOUpaNnh2eGVC?=
 =?utf-8?B?TVpaTzQwbmoxMnRiUWl4bHgyWGNOVjhVejZzd0pPWmZyWVdkb3Fpb3lNU0w3?=
 =?utf-8?B?K090ZlZhTDk2UHZoRU9Gek96TEpFZXpwWjIrd0h6Y1UzYmx2VDVpcGhIMEZa?=
 =?utf-8?B?amgrRmRZMERKU2R6SXB1eEhYY3VTYXVaQUJTYlU3cDc0amZIelNVZGZoUi9j?=
 =?utf-8?B?QVFKNHVPQXVoUDBkNG5OeXQzRktUYWxTLzFLMTVEU3BWMzBpTVVlM3oydEpR?=
 =?utf-8?B?dmMxRlZDYSsxalRKVThJbkVLQit5NjhQV1ZONGhwSkNKaVdKOVA5QVNqUzRX?=
 =?utf-8?B?UUtqdjh1THlVcFBMYmhWQ1FkczhGbmd1WGJrd0szYm42L2xiUDM1WmFLV3Fa?=
 =?utf-8?B?N3U1THRWVnlZME4veU91Ui9yMURwMERqcVhUd3VzV2pEUXdJc0wvQjBCbUgy?=
 =?utf-8?B?NWRnM2k3MDVUeGdtdDBqTHFiRm5FK3RoK2R3dCtxRGZESy9Ld3c5d0lHNFVp?=
 =?utf-8?B?dHZlSVZyb0EwU1p5OHg0bWNoT3F2QzZhTHZrcXlXeFlsUys5SjJyQ1JvMWhT?=
 =?utf-8?B?QWVUcUpWRS85L0xZZ0JsT0RPcWwydVZnKzRuL29VVCtpUlhROEVNZmNjZkZC?=
 =?utf-8?B?clNqbWtDajVCK2NxcGo0OWp5NTRWKzZzaFRqYi9pbjl1R05CRVRDTE5LdnlX?=
 =?utf-8?B?Z1BINDlWN01tdytud3FyU2lKUzBwTTNqcy83dFJ3ZkVWcjZpV2ZuRWk4MWlB?=
 =?utf-8?B?cStxaklFM1hDYkVmaTNjT1hTd0l6aU5rdlpxNkdERkdPY3lrK1Y5aC81TXkx?=
 =?utf-8?B?dTFTRTk4TUxLc0MxSWh4dmx5eUNWd09jclNMZTdnNGJZZnBtaW11MnpBQklG?=
 =?utf-8?B?TWVFZUFkR2xrVDNzMkJ4NFY5WjdVRmJ1VmtjcHdmWHdvMUJMUlZFWHFUYnJj?=
 =?utf-8?B?Mm16S3dsTHNhTFZlL050Wjl2OVdMOHUySUZGKzJXWDhkVzlCUDFyT3dlM3hO?=
 =?utf-8?B?MUxKK2hhSGpYNVBIK0MwR3pIS09vMjZpTG5mUkNTK3J3S2lLTTRGRzdCUWFX?=
 =?utf-8?B?Z1ZELzgraGNsVEFzTXkzWGJFOTJGWnlzMjA3SkpkMUdGaFE0ZCtWMU1HSFJl?=
 =?utf-8?B?QWRvZk53TklGYlBabUNTNW5qYXc4NzNxdFlXbjdCZDV1R1NPN29MUkR2YUVp?=
 =?utf-8?B?OUF2elNMMmlVRW9sTUVGSGVyM2lSYkVtcDNwcEtCM0hOaWt4Y0hUZmpOZFBp?=
 =?utf-8?B?Ull2aTFua2t4RXp4TGFmeWV1aG1LYU5kaUlRMHdSTTFMdElKMTg3cHFMNUFu?=
 =?utf-8?B?NGNkT3V1dk1TbGI4UVo2c2xJVGtnSU1zTUpZeGRLN2lYK1dxb1BidldGdTI5?=
 =?utf-8?B?bTlKaTJPSGx5UmxndVRaczFCRGc1K0ZsM3FYVGEvNDRqU0R6VWwxWGNEUi9v?=
 =?utf-8?B?cnpOVU8vdzI4VlJMSlByU0Fwc0d0Z2xFa2VtRGJ0TzhnbHJmRElKTUxrQnRN?=
 =?utf-8?B?T1Q4VFRmK1luVVFjVUZtMGROVDR2RGRPTUNTc2M2M3FvY1Z3UFVwTzk4UEI4?=
 =?utf-8?B?VTNPL2xnMDJxTTg0RnoveDF2V1FmTFozSU13MmNBRld1VlhKYm9QSEsyby9P?=
 =?utf-8?B?WHVXcXFSWEdjN0R6MEFsZTVZekp5VkJzbm96S2JkZkFGU2xISlozaXB4MFI4?=
 =?utf-8?B?Mnkydy9lbDBkLzhpU25FYjB3Z3VydlJ0RnhFeTdQZjV1T3FLeTZBZW1RVFln?=
 =?utf-8?B?MmI0WVpvT3EzcGt0TEwrT1o1YnduSW9IaXZwYi9xVUtuM3ByQU1LTTc0VXBk?=
 =?utf-8?B?T20zNTF2NGdydDN4NitBUDAzMyt1bjkrb0FBRDVTKzhabzlhYWZra1JmOUc0?=
 =?utf-8?B?Tk1WV3hlNnl2dk0xK1lZWFZNYmxiTGtFNkl2KzJTYmZ6RkN6YmlLMkRTQkRa?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2db90a-9419-4896-ac2a-08dcfccff7e8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 12:55:32.9036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kqVz86sG1HcFuyz2Iv1ToaUMZFxKB+3rMlEOwrF2ljtZRFnaWMLS4lmdQG6NRHnJwfsccG4mYzFuGYB8Qkvmw4nOa2Cfov9WTls8pJt9Ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8330
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 12:55:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5655

Hi Antonin,

On 11/4/24 1:39 PM, Antonin Godard wrote:
> Newer versions of Sphinx already define a :cve: role that points to
> cve.org, instead of the role we defined in conf.py that points to
> nvd.nist.gov.
> 
> Rename our role to :cve_nist: to avoid warnings (treated as errors).
> This is also backwards compatible, meaning we can build the doc with an
> older Sphinx if needed.
> 
> Suggested-By: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Looks good to me. I assume you didn't change those by hand, maybe add 
the command you used to do the migration so we can figure out if 
something's been left out inadvertently? (Would be useful if we figure 
out in the future that this missed something so we can more easily find 
a programmatic way of fixing the left-out instead of finding and fixing 
them by hand?).

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

(Admittedly only reviewed the conf.py part :) ).

For backporting, we'll likely need a new patch on the autobuilder, c.f. 
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/docs-build-patches 
since we want to build tags which we cannot move.

Thanks!
Quentin

