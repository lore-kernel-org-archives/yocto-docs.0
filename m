Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15195C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 14:59:45 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.44])
 by mx.groups.io with SMTP id smtpd.web11.9016.1676386774449925297
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 06:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=eaTmiz7h;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.44, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGzzIe/jXwwg3A8TiYSMySLeb3dAyAMpA72N2y1EDiMvDCf2Cp0cTZujRobd2wnX6LvEUkg8Api5HGp/iWtg3ExOBdjAu5y7xKgr452pUX0vZdOhtq6U7dFbszd7MCAzuRDZuG/2Qjkn9n9WM/043mGEdgsFxp2BEI0p5DJo9k2pm6ahDcVZodFB6ZvRg1OG22kTgnzq0jQR2+PYaHZAyVCeqcg7bZunYfzTEnuhvWKKwyoTZtFWpAzj60LDdGMvSsmZmQeIFPg+hDi5QBep4tF5Hnz/iWTFe9urCTpG+17furYT9OKLQDtOXAcRV0Zf364mB+EBdFoJM0OLhIGhDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jCQECyajySC6532exbbvRlG1pT/XOb2J+abJhHcegc=;
 b=FT5bdZNRKKvXtS1Q6TLyQ4MsYLtbFeZFbtGglKrQNE00zgG4kmXMBPnlE8eveO+VdPj4JL2p5fV9aaAsJG77laipXy+WV7QDrbTsohXRjo5rFCYSXCtsYPYYOewS4IzwDp8zV0hR5KyK8UdqGePC0S8g3SPqPWWu3uDcXuwS9fbHTnvOs3HSPqkXbR47749iZDn9iTXW2Suowvjfvb4yRD3VgBInRai7q/eD1L2kTQBJgN/bLvPa4HN4VkwW5hwi9FqNVtXGn3hyMnJcxbSWtEZfbbY+iKGb5HCCBG0Tw1xFlWKyrDwOi2XAsgxMW0z0kc3j/FP6ZfAQvrytE/rvXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jCQECyajySC6532exbbvRlG1pT/XOb2J+abJhHcegc=;
 b=eaTmiz7hnGMeiqAzoZR/32IPRBAvH0mm3MVLWRItc0eTChsqGosTKnPE55pWl0gNRt3a6ZObbVjgN3qf2DgJvCCI9BsgHsfUbqf1g7Py4ymXFMmht7rYRs8PAJ9CtMVdJNBrXyHbRxCeRILxfA2+SIWpU+vF3l4og/OAiM0/crZYCvc4mj5uVBBOkwDxPLb9XVmQG6AIKh8C/57eQJAcm/FwuxC+iU+REQUmT1lVfztee1K7bU630sFdcO6c3Gv2RLvtlT24wDV5gAi5IPuIfMpUSSKD3wTVT3QQ/VPOYUCJlFa06kfLeKGA9TA6cbkaUftIVRop/j9QgxeLqKtCuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS4PR04MB9409.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 14:59:30 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%8]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 14:59:30 +0000
Message-ID: <0d6bca8c-e563-993d-6dfd-607a47f8ab2a@theobroma-systems.com>
Date: Tue, 14 Feb 2023 15:59:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [docs] [PATCH] [RFC] dev-manual: stop advising to produce patches
 with Quilt
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20230214144927.80982-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230214144927.80982-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::27) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS4PR04MB9409:EE_
X-MS-Office365-Filtering-Correlation-Id: c2dfbe5f-5088-4710-e831-08db0e9c135d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J/8CX5l2UCWsVz3i9eaA73fl60MTaYn52Ivh1OIfIt1ZU1Dd61OkXye7QtkCukBpNpt8tkdBfJYsiv1ZYJw6qeYmxnLbgdQXe/5xmWmmU1U52Afc+PlPNF5wYYqoTNFeqUjOj5nBOI1/JVSbwwwSay5c8H1578e28BFzY9KSES4GRVFtA8koTty3U8TpCIKqA0Gv3oiJfBnntN1J77WKDqPF+UapQOuz1i/e7ByA3syalOcUBR/R5XReCrgDoG7nHNlIPU7XHiEe8hWUv+JVleUeUkrwHccnyRZgRq4nNopZPkWWNYXWkfzyvhFBkpFrU+zHiDK9xTc7w8Fe9BeE8xc+SsObTAjz+EiBCLM2xFcafGV7hvSB1ETOQzaVPY0LdUFbQsD52fZHEChCf0GESByIgrhQF4fmZDOoLvnMZiGkZtSylSRTq996rHJix88P1C1ir1Zl69lBE6SyNiTohGYNsfEvsKkyARPsBxBQByWbJYSUDEZRXrXAEwTHm8lvBD9NLKHf/QjTPEAPJHV2+0ii2TEs2NF2U7FeTcjolumi8dn+5otr/tV2/ty4X/qn/FcddlKC/KlHadEVpq1IZbvQptmpZEFc6Xc48n+zyKt/Tt6iTDn7u2+wUoMVW9M8iShkCyV00h8dHCzM9/QWyXWhvXdK/Bv9QhHmOqv/AQp8+IL3oFSVjYtY92bqItL9NaaYAYsXBCc0V3Adg7ecaIuI7tIl+KOLI3XMko0IDPw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(396003)(346002)(136003)(366004)(451199018)(6666004)(6506007)(6512007)(478600001)(6486002)(2616005)(66556008)(186003)(53546011)(66946007)(8936002)(8676002)(66476007)(41300700001)(316002)(86362001)(38100700002)(31696002)(36756003)(5660300002)(4744005)(2906002)(44832011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dDRjNGZDWGVBUDN1ZHBtNkxqanR0VEVZRHltRjdQdFhGcSs3c3J6VWxEK0Vr?=
 =?utf-8?B?SjVQb1Y3THNFenl6RkpQNlAydXB5VXNPNXhhWDBzL2xxeHRmRUJzV21TMG53?=
 =?utf-8?B?dE9FOGtqa0tvVHV3RGNOMnlQcFRqMGd2MURyRGMxclNmc1g0aHVCSm5aNUlT?=
 =?utf-8?B?MDhvcEdxc0IrcWNYdUYvWE15V1J2TjJJTkNyN3Z5d01BOEpDTkpsaWNmaWM5?=
 =?utf-8?B?c1V2RmpiV3NMK0pVVHdoN1hVaUlRdEljUnd4VnZrSzNMWmdhZ01scTQ4b1pS?=
 =?utf-8?B?RlBTZ2pwVlpTRGxFaGQrVTM2ZWYzd2xVa0cwWUxpMWo5bUxET0dmQTMwMzVj?=
 =?utf-8?B?cVFoSlhjbDhVWnVZbDJCSENQdTRXSjFtN3BqSHRqdzZPbmRVOGlMdkVVdVpC?=
 =?utf-8?B?SCtJR1YyamhNY2phT2svb2o2SCtobzl1WHl1WGlaZmVlWm1zbnFPRnNRRGFZ?=
 =?utf-8?B?d0djVnNmMjM4OTFoRlZOd0xEa1YvbStyUmJCVlJlTHRqc05rV2M2bHl4Y1hs?=
 =?utf-8?B?dmh4OUljbTN1QlNFNUpGWlJILzRQbDFieFpRdUJCbUhvNnlwenNkRHd5anhk?=
 =?utf-8?B?V2F0NERHanN1b1pEVDYvR2pmbUc0Q3gzaCsreWdkRWY1ZThLQk1jN2Nzb0Z0?=
 =?utf-8?B?TzREUFJDMXMrTkpsYmtoZks0TEFOb1l1Z2F5UFNJS216Ti9XK2hvMUtMeWlo?=
 =?utf-8?B?MHZzdlVvRDYxTE1RcVBoVysvQ1gvdTFGUGpKL0l3NVBRbG4yME55MTkwMmRU?=
 =?utf-8?B?aFVFaVdVVFRxakkrNkdmSy94blBOM0tJRlYxR3Z3ZlpvQlkrdVJVOGc0b0VV?=
 =?utf-8?B?V1Z3bWpCTWgydys0VnlwRXFTNG5CWHZ1a05kQ25hWXQ5bjNhYk81ZHRwRDYv?=
 =?utf-8?B?ZmptMkk2WVg0MkZXRnU5cmF4T2dLbnJqRUNoMXVvVXJqbWFQNXNydy9HTFFi?=
 =?utf-8?B?NG1jK2I0MlE5bGJ6Z3AyQzh0SmJsN0pmYXVvUU1jQlVVWVBveGJWK0NDV3lO?=
 =?utf-8?B?MVlQdE5tc2FUek5GU1hJZHlyaU90RllCeDkvZWxrRm5XODArRXBacXR5c0Jr?=
 =?utf-8?B?UEhrWUdGcExpY2tTQjVjcVgyVVl2c1ZJU05VZE4wMDZhcEFRMmRza2xZblZY?=
 =?utf-8?B?dnRHeXlqUStlT2pNRDJBRzVhM0ZYeGJqR3MxYmdhZ1daN2tkUmkvU1lMejAy?=
 =?utf-8?B?SXd5NXBTVVU0U3dqa3FUVHFZUDBQVEZOeGg1bHZPek5XamdZZFh6RTlCV05o?=
 =?utf-8?B?WWg3TWMxVUpJa3RmSlVqeXkxaFdiU2IxSVBuR0JWMFZhekpnRkVIckZ4RnN1?=
 =?utf-8?B?YWI2amR5d3kxNkprd1VuMVBIeHdJK3dKVXJ0bUFVN1E4ci9zbUdqeGptelg1?=
 =?utf-8?B?NE1VR1FzbWRXUTNpTDhmRlh0Zm9kRGVoTnMyTW85b3l4MVRYRDBLQVlDK0ky?=
 =?utf-8?B?MUthUGlpQkhjbWVUQ05GNGRRbklCd2pOVmNieG5LQmNVV1Vsbm5VeENzb1hH?=
 =?utf-8?B?QWhMbUc5NTRZNGxWbG9kaW9sUVU2dUo3M2U1SE94Tmg2TDM2eXlEY1pETk5m?=
 =?utf-8?B?OFYyN1V6K2J0VVBsYUY0VUllc3RiSnNrOU5UREJsVVladzVxWmo1TzA1cmxn?=
 =?utf-8?B?azlqdHd2WS9paWduNVphQ0lvdTFsRnFBdzc2dS9LU2tlRHlhN0dWdlF0RlMr?=
 =?utf-8?B?bCsyaEg1U3NGRjBkRUxvK0Jwb3I2dTVJQmFQbVhRaEFmODBZZkdOVGNGcXkz?=
 =?utf-8?B?TkxBci8vTm9GQzA5S2lHZzJjUWpZTEQ2dnR0WVk5UHBSdFh1V09STGtsaHh2?=
 =?utf-8?B?dlpnWjdUUCtCVWVsUFMzU0tDcld3M2x5azJwVHNQTzN5bW41NFZ0b0FFcklh?=
 =?utf-8?B?UTFNRFFxcWJ4d0U4VU52QTBIdmhYSit3cnF1ano3RTZYR09yb3cxampJVEVp?=
 =?utf-8?B?Qnhybmg0U2s1ZlVBR0VaNlJpTjl6UXR4b2NPdjNYcEpOWjNQNmFtTEgrRHpY?=
 =?utf-8?B?ZkcvdXNLam8xcis0dFh2eWliR1ZtTEdQT2QvaGtQY1ZHUkNtMkczV2xMT2FY?=
 =?utf-8?B?eldidGR2TE9RclRVQjYwWnlwcForZUJnN0Nzc0IwbWVCanMvb3Rvb0krT1Vl?=
 =?utf-8?B?cU5VRjZZRW5iekdic1hkNlFKSUg3MmgrY0JKRDdlT1h6RC8rWm8yNjk1Z2Z5?=
 =?utf-8?B?Ymwyak1JdCs0THZ5YkRWcVc3U0VXVDlicnY1SFpiTW5udjBtdnB6N2g4NU9a?=
 =?utf-8?B?b3lqY0gvbHdqcU4xOG9BNHRiekpnPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dfbe5f-5088-4710-e831-08db0e9c135d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 14:59:30.7540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BsxH4oqg9IwuP35Ve8o0uO26M333NOuulAt+TZUyNqkcDjWouBMEblMgw9HZ/RdbzykC9oOaS7xGq5IIBZZZAIZo3sOg3vPo0gd8xihYDV/4s8znPyao+2LDtgCJEV54
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9409
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Feb 2023 14:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3684

Hi Michael,

On 2/14/23 15:49, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> ---
> 
> Who still wants to produce patches with Quilt instead of Git?
> Who still wants to accept patches which are not generated by Git
> or a modern source control system?
> 

Well... Quilt is the tool used to patch most recipes by bitbake AFAIR :) 
c.f. PATCHTOOL in meta/conf/bitbake.conf. Since they probably have a 
different conflict resolution, it might still be a good idea to explain 
how to create patches with quilt? or do we expect to just say "set 
PATCHTOOL = "git" in your recipe if the patch doesn't apply" ?

Note that the only time I had to use git PATCHTOOL was for patches where 
there was some binary in there since quilt doesn't support this.

Cheers,
Quentin

