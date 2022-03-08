Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21828C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:13:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.79])
 by mx.groups.io with SMTP id smtpd.web11.8384.1646748797146458003
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 06:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=ApaBbi2t;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.79,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKMIAiE2UQtb/9txJMYhGU99aFrtf6+H3vrP1jSCVpecqxQSdBD3yTm/1bPSEYM8xP04iFmZaXQ04M4p4wY/3V6zAhF2/DT0RTbGaRoY/hc/8fCEhSZrkdxcDlhSRADHHfzxN7OSzNi0evUJKl0JhVfmOLgjBW+QLow1KSV/y7oCaICNchK/x0gTSRlkX48SPeqFuTzj5SAavhA/f9sjGE8TcOfJ6sO8E48K2M1De4NxPp9UylP4k4fWwO0uOU6LZlMEQVg8d3Eu0H0s8Earg4GDFYDWPL4CWeHqjTBhz3ZhYRDYWRr65Acp6j9OtLwSCqL9fcC+ZW+HZewTSh6I1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYiiz29xz2gMY5l1BvZj58mWxIOTKrp6JappMXOmkp0=;
 b=j64s5GdfItrJImghrWzLUeSzwh1tMk/WVh7nGJHxVgRy6NUXPvlAF00h5iul2J47t/Yq2SheDABIg4GCL6rb9D1wDMyuqAdIdrwY1KaDJd2pcQ2rNZbCOMruK2DhIZ/apJeOvUyxVsz1amWTPS+y2JYpjX3b8nR5Aqduuc0mjSzzxCcufBH6O6lnbzo8sUxwx0yXWGjos0jtHCE3oPaq9Wh/MDvJCMt4Q+lTXchE7mhHg9HACkkUpILmioikM6aeEbZygT10EOX5feivm3pZWE5UDvyfNywuJi+icO27BUeXmvx1SrjTo9iKjfxQGP74KNuZRBlcdgKXgPwygZPhTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYiiz29xz2gMY5l1BvZj58mWxIOTKrp6JappMXOmkp0=;
 b=ApaBbi2tNX+OKSwb45yWzCOWAiuT2wj2s/O0AzM/HmPKW5LIqho9b06T/ggiEEbEPnikJStes910Kgs0R2+fwMDzesgCGlUeM2+0AeUynEsjl2EKJcykhmgYSNt7Jz9+9+Rafs28euTi6ziJb6b4q4s1k5QzLtaKxiKBxXI1nE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR04MB6693.eurprd04.prod.outlook.com (2603:10a6:20b:d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Tue, 8 Mar
 2022 14:13:12 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%9]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 14:13:12 +0000
Message-ID: <ce03a746-4ba4-9ebb-2f1b-fc005349365d@theobroma-systems.com>
Date: Tue, 8 Mar 2022 15:13:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] docs: overview-manual: formating fixes
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220308140425.581011-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220308140425.581011-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0501CA0041.eurprd05.prod.outlook.com
 (2603:10a6:800:60::27) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 177ffce6-9fe2-4e10-eb6c-08da010dc7ac
X-MS-TrafficTypeDiagnostic: AM6PR04MB6693:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB669304EAF927BDCDBBF78450C2099@AM6PR04MB6693.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QO1iuMPZB+8/E4XCCGW3VnwQaj6Az0F1Blt+KY2sm56Eqi0j8mEE+kbZQmY1tN7f7FHQlFVtQuEu+JVPsTlyZ/jq5Epvhyl1YU7rkAEAHBQn9VYR0UMoJEHtMre7mOlKEomk8GMOhfUTkXxCrqDsdPE+Jp1LJWyEgUx3nzVahaXEiljJ+o1Mel3nth0dBKayVOq236w8d8PXXB/3jAk6WCRjGn3oDuqbpgN+aVSAnQf0dduIIxWktt/909Yuysa4s3brAhDyeNRX1a/vtsVQMdQoyrmOhAzB32mmSla8lNAQ+uy3PwOG66iwQ5yLbTwYXzPbY24vrRNluyLm5ptRu1o4WiDm7l5hp0jOU8haCtzG8zVwiGmulypCeJMDHTYKwvW9Cgv/cd6k4GLbpgAmpSTLKi+KRPD3nB85dXH68uoFvmk9r4Bfv9s2Zs91/AWMSf+T0/Nf3frEu2R5dwU5NHoJX6LhV4U+yNjh6u8Lglgg/rpgL/V26jjTbBchkXAoXuiaREV3LHsVg1K4y1EXUIZEkPq9DUZdheeBalg92FP3BgsgGL6prjDbyDEK6vKnyt4/07GH5KTiH77h+isQIWYaDyafBNkEO2BWUhzNQFvFdVyB9E7T9nNLilbRgTQoHuzy6HC6PcLYaGow0IWtHyuIJTFxOvjEDIpZXLXs9kG+5W9kIzCZvc0v8Szlt/hGUqUyknLGl8/6HgydDPuXYwVnBEb/lpiDRtg8KbPr+wA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(53546011)(38100700002)(6506007)(2616005)(31686004)(2906002)(558084003)(5660300002)(6512007)(316002)(26005)(8936002)(66556008)(66946007)(44832011)(31696002)(6486002)(86362001)(186003)(8676002)(508600001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkdmNEtORC8rOHJiUXdxdndPWGV4dmlkS2ZYdmovZmlwaFplTUxtOXIwbDBJ?=
 =?utf-8?B?K3hyTTJKSE5NN1BpK0I0Z0dUVWtzVWpFdUxKWjZuRFhNMUZ5K25IcTRUV3l2?=
 =?utf-8?B?S1FpQ0pRdkhnbndsZzJjcEtNZWsreU9HU293bE1Ld3hGNVpYOXEyeUgzVkpp?=
 =?utf-8?B?WEI1ckMyTk9UNnFTYndXSTN1Vzh1WjhGL0R5NmV3ZkhlUkV3MjdobmxuYjJU?=
 =?utf-8?B?OUpZaE16VFYvRlE0YW90VXhjazJmc2VEK093aS9oa2hId2k3SHd5UzI1QTBZ?=
 =?utf-8?B?SnNubWlmMVJEQVRZdUJ2ZG05TWwrMG5mbklIdlNVQklYWWhrOHQvS3dFbG5s?=
 =?utf-8?B?aDZEZWNRbkhhNkZkZFBLUUs3QzlURHhDdm9GeStMSmt0ZlpJaStTYzk4MXlw?=
 =?utf-8?B?RG50azR3L2RzWFM3Qmh4SzJkMmg4UE9nWkhwc1NCNzQwdE5hTXJRTHZ1bzZG?=
 =?utf-8?B?NFpBRmFUTTFCNG93UkRNZE5DN0pKT1VvQXQ5bGdrWFFIMHZyeTRsQm9FdUJp?=
 =?utf-8?B?QUdHRHpvb3VPd2tqWGlrNkhWaFVUQUxTNTBaN0s0N0p0UkxSUEVnREQwcnFF?=
 =?utf-8?B?UUNMV2V0c0Z6NXRaby9ERWE0SzIzcithNGtMdEc0TnlCZHBWNGRnNXRUSnUx?=
 =?utf-8?B?Yi9aMTV5SXJmcHZxUGlhKzh2WmRyRUlZMGs5UFBqTDVYbHV3VGNIZHlkNkVu?=
 =?utf-8?B?V1J4bEtQbU5sTStqRUplU1psV2c3V0loZ1ZLTUZ0TDIwbkNMeExsRDgwK0lC?=
 =?utf-8?B?V2ZobWtwMytrNTlyS2M4MkYyaEJjRlhObmsrd1hTL3A1bm1Zci8yR2o3WE1u?=
 =?utf-8?B?bzIyWlp1eFJjcENNQVgrZnhEamFQU0ZPUG5DMUgzVUVkZm42eGQvRGNOUVFB?=
 =?utf-8?B?RkJ2UTU0UEp0dGt4SzhtSUloNmZrcHRUUUVMYW9rL3lPN05IQzRmcnlHQ1FK?=
 =?utf-8?B?Z1pmYUl1dk83QitjVmI0UGpZdHc1WHdMWlY3Vi9QSWVhTUdTS09iMDlzRy9I?=
 =?utf-8?B?SENSRG80NUZYWnNmNDhreFdPSERoaDJNTGRmWktOeE5TOW5LVXFNcitOckww?=
 =?utf-8?B?cVpxUWNwZllDL0QzSGpjalBkeThxOCtTRTZkbFRiTFprTjBqZVNCWVAxaThJ?=
 =?utf-8?B?NjlHeFJ4aENNNDRjZ2lsMzVZWXFLVE9TYWhRZjdWY2JSNUdpWjZKaTIrdm84?=
 =?utf-8?B?bEpwcDdEcGdSbDRjR3VGdUZnSVlMTGdNaXhyWmVQUkVTay9aMUpGZVBaVEUx?=
 =?utf-8?B?MU5iREJ1UzFwSkpENjF1bU9lZXZGc25nNHRRN0ZHbkhqN1dBVFNyZEk4ejha?=
 =?utf-8?B?dFhXNkVNekZhUUVXMWZLMXM2eHVnaUFGYUlwSTczZmVQYmYvRUwyKzFLQzd1?=
 =?utf-8?B?SUdsNWFkQm5yVkJ0ZkV1eUdCUk9mb3JlbHZzM1g0aUtrR1REMENKVTlMbVIw?=
 =?utf-8?B?aXgxT0RRRFZWZ3N5N25vdTFYbHpJWlJkdS84Y0Z6QWRQby94QXc3Z0dEcU9N?=
 =?utf-8?B?Y3hOd0RBOC90SVpKaE5SazJEeVdxOGpqNFZ3WHY5TXZ1TklJcXNLU0tQMDQy?=
 =?utf-8?B?WFhwS2U5RzB4bWRHNU9iWkJMSUlzeGNQYVpoemx0eGdBWThEaEtucU84SXVY?=
 =?utf-8?B?QjUwNTltZjFzVGxyS1BZSnBsUkk4N3laWEUvOXcrTEJUT2dwMTB4RUlPYkx3?=
 =?utf-8?B?OGhGeWwzTTIvRnhON2pJZTRYZThuazRMTVFROGlTRE1DOGFNam5OYXhPUW05?=
 =?utf-8?B?eXJmTHVFQzNEbkl3d01qRnpZWVVNbXdobUpVb3Y4SFdET3kyRDQwNEw4TGJP?=
 =?utf-8?B?N1p1ZUdHM1lzUWZSV05vMitMRlJEVVYwUFpQekRaZGRadGgydWhMVkZ3ZWVH?=
 =?utf-8?B?enpKSE5jd0ZPQ3hXakR0c1FBckdtVWhNN2U0b1pCVll5L2tnc281cmNzNGZB?=
 =?utf-8?B?VEsxc1E1TzE1RGVKRUZIcUVpSHJRdXlUblN3MElwcjJVQ21LbVdDWkc5K0c3?=
 =?utf-8?B?Q0dVc1hHMGY2N0RDckNGYTNCWWtQWDg5MEw2WjdMU0JTeHdNa0kwUDZQNlF3?=
 =?utf-8?B?bHd3NUpLVXkvZTZWTnJKZlVnZzBzcDFmVzROd09LKzVpZERnN1FrT1h3R3RB?=
 =?utf-8?B?cmNWTnNxOCtWSy9lK0xSRy9JN2RpdVNiRGpiM204ZENHdWJSNVVEcklFeGxk?=
 =?utf-8?B?RE80SkVIakJPenZjZFFEMDZ3RWsxZWFrV24yRlF0MmdoWVZ4ME8vbmhDY2VN?=
 =?utf-8?B?VTczUlhra0ozRTUvTkorVlpzc2l3cTlVSUk1b1FxYUt6MjBUUjV2MnhHeUF5?=
 =?utf-8?B?YUtRS1JnM09BVUlIVmNWUmVTSGh0bWNDemU2TUFWd0dtdW9HR2tUZz09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 177ffce6-9fe2-4e10-eb6c-08da010dc7ac
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 14:13:12.4735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 V+aZW7YXE0cbIJnDgFqGimhx8p7B0RLB0fEaYIrvu+cBPQHTc5KHyNG9T3HgkLn3w3W7XgdPn0fSeUH7K7l+FnybtD2hHeOPvYZhXKRCutRtfe7v+ixuZ4Tuy3Y5oIUq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6693
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Mar 2022 14:13:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2543

Hi Michael,

On 3/8/22 15:04, Michael Opdenacker via lists.yoctoproject.org wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks!
Quentin

