Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14011C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 10:00:08 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.75])
 by mx.groups.io with SMTP id smtpd.web08.6378.1651053598864941575
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 02:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=mvN4q0yv;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.3.75,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdhwMC2CV01MfuryahiyV7ClIKUsnpmbIjb1UFnliS/Ft5IIxwtJugccMoa4t2fVnk5fB9LBcBzRSZfPFr5gNsdttPM46vM4OWw3D6PP6EyfPuhmWfAjd9ax/eNd9FsWLsO0UtSPJACdzTuMEYDyZxz0d3ZgEHIPBevgbQCFZ0aCe5SnbyVLRuBxb7H4YnTB71mqNMzqOziymzKkdcBoLPH2ltUX/sw4xxlF0dQYP9+lDIgYoE7+PVeQvZfQZ5ykT3SqaYbcUjmhDXIVBPyyrLdYmadhHEVNtwFAQDzmH2ucolaOiBYqgmNwrv4VxWOV0ERJkGnaASY5oih1yQiT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqmKf+rF6HJeslSt2im/GMt2eC+Gv366XCkoiaNHDRc=;
 b=ij/fQNCyE0t0oHP7g3e1olJIz87la4kqtjiC18gXAmvdO+qGJMi13g8Ix06DEceLfSKfMES8Nb8MZrnqWtzghPN+tZYcypCZuPPCQtNr95u3Ita48c81AqTS7ZroNrMMoGnWynunprr4xEQwaTukdv4hpoiP0DPcF2XW+Qtert1lz3yL0PipVERqwXlk0TTd+RzA8EgCXTpzQnTJLzRFJ+Pe6iZvhomiRzio8ZowbD5dYnyAR0EH9vOPuSVV370Y0coquigY0DzP/9NHgWw/wlVkjPkNHLRAC/hhRx5/OTQrKiZljJaZzNZvz/h9sLzGCOPjiijrF5R+ijF9LT+YZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqmKf+rF6HJeslSt2im/GMt2eC+Gv366XCkoiaNHDRc=;
 b=mvN4q0yv8BZGfZL2UPyub5f1/vDlfecbSkVlFo8dTCaIUK4iauYh9vvjchjw1s2vlZUEUb73GVpMIVAb589W/cvaNVRy38bMSY4U/I/3mVGYSuukQqkiMwaHXKAlUKXQ1H9n1Si62Yjo6sJuKr97wRTSS6i/LouO2Cqu+6npKho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by PAXPR04MB8942.eurprd04.prod.outlook.com (2603:10a6:102:20d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 09:59:54 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979%4]) with mapi id 15.20.5186.014; Wed, 27 Apr 2022
 09:59:54 +0000
Message-ID: <f413500a-5a0e-a17c-5dc4-c702fd2ff1aa@theobroma-systems.com>
Date: Wed, 27 Apr 2022 11:59:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] Sstate cache for version 4.0.999?
Content-Language: en-US
To: michael.opdenacker@bootlin.com,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <6c3311c1-801b-b17a-44a1-ca76017e9e94@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <6c3311c1-801b-b17a-44a1-ca76017e9e94@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0034.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::9) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d81a565b-e390-40d3-f553-08da2834ace8
X-MS-TrafficTypeDiagnostic: PAXPR04MB8942:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR04MB894292C3ADF7A8D1F3461863C2FA9@PAXPR04MB8942.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TE0YIuMGUxo2wVlUn9M+U5/ShO4f5Kevl8Bfh46XnvItF1Jn3ZyRW93VsiJb8TycY1cZBOEqo67ClkEfFJ8U5hAYvqfDJ5EqcFgwGz5CFqAPnvCc/TOGxt8H6+pcTaJ6WxgH7kUDxvf31YFce56a29d2PrncuXMiSO4kkkCfLPxFysMOtCuCJat5iWYz0ppCStJrxuyncU43A3jEA7A77FErmujtUC8BID4i7QkoSRX/HVe3PKLBZ2ZSTpXzfgEXpC0u26i48k/6HJTFz6V9MbSoex2ThjAuO4KV+3hxZo31bhUgMvOQxzkwzMbMp5OGnEPh6Dxxo02cWY6Eqr6onnoUwPfTRSYqQIgfutqbh0ZGyDnH2Yh8raE6PoUxmIqKEC10K9rwdtUWUWKKO7+yWy9HXXr+pLbYX1pa2F3GWsz1PJuQ206I5uhAvhx7dUw/w9t9h3DaD9kOdLmJscU6oOlA75Xldan7dPqYN2aFl79j/8x9UXzwXjt6NcRkv5rbGNLpHGLkTg7m05Aommbw3PDJfrU6qFLvBfWkveVT64oUuto3rErJAA5BhXoDMUzZVb28X+hiTxc+Snt7uCBaITPDHCZbUpKz9Dymdgl4FOjgfrsh1DYxYDuxgV68nAuKYnsOvZjjVnMg/ykpwVlDsFrX1PLUn00FMD8A3PKFYKcy5JI4mdqKHPlIukU60LfD6qen7+hSp1n1KrQ8Wp28G5J4hEj8+bD/hAuPz/RNYJ/kbRjYXwlqmAnk18iu7wNKqwAfxjnc1aoskrSGF3opCLVdleA0e2WJOv5KnDK/Bj3PxijFbZcyNfzp59sAPpLs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(66946007)(66476007)(66556008)(53546011)(6506007)(2906002)(86362001)(38100700002)(5660300002)(45080400002)(44832011)(8936002)(508600001)(6512007)(26005)(966005)(6486002)(31696002)(83380400001)(2616005)(6916009)(316002)(36756003)(31686004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OS91c3pvRjRGNHA4emRtcU9wL3J1V0xJTjd4b0cya05LaUNSQjFTN24vNU90?=
 =?utf-8?B?RW5yTTJRTkx2VENNbkc2YWp4WVRUcTc3dWhId0ZsT3Zkc1U0T3YvRFA2NSsv?=
 =?utf-8?B?Kzk5b1RldzlVcGxQbEoxUC9EdG13NDU3cWsyMWJ5OHk2ZVlRcDVsOUJNd0Fh?=
 =?utf-8?B?aVJRMmJhUE9abndvcmh6b1lUem41YWg3aEVjSFBJbnhzRUdUTHNJTkJkSHNx?=
 =?utf-8?B?Q21JYjNpTFBlNWU3bEpSY0R0YStjV3F6c25qRlpTQmtZMTJHTm02cUp0OXY1?=
 =?utf-8?B?b25RR2NTVkhLbUFMOEcwbEdBK0sveTdOVHBybmxGM0ZWQnFybGRVVjZ5aTZC?=
 =?utf-8?B?eFNrOG9qeUhVUHN2Um84Y3dEM3I3QjRwSWZ5NW9HRlJlNm1KMzhyMFZUcXR2?=
 =?utf-8?B?aklPTmxXLzZPanFBYXJyQVB6VWlYV0lmdWJtUCtTVGh0TDFNMkN5QXRpZEQ4?=
 =?utf-8?B?VHBwTnc2c2tZVERuQ3ZuNm5va3hxTlowWk1aS2p5N3JtQnZqbHRGNVlnYlhQ?=
 =?utf-8?B?b2hxTUNMajhVSzBlTWxvT1NzQ1I1eVcycWZTMkRLTGI3TFk3U0ZvcFJodkJV?=
 =?utf-8?B?NGExOGFVd2NRU1lDdE1tM01hSDBrZ3ZJdXdLTE1BdFFZSTMzU1lSa0VyZnkv?=
 =?utf-8?B?dHBEWkZiRXJMOEVTd3liUUlNWnpDckRIOVFrUnFpaE05bHdJaVd4SmJaY0U1?=
 =?utf-8?B?RC84OXBDWWJzcTBMdndYSDVHcVluc0hicnBJaitmSFc4MkNxRGRMRkw2ajBz?=
 =?utf-8?B?NHFVejd1ZUM2L3phT0ZOS0pHNlFyYkhVRm00RGNwUFZTR1hjUWUyQmpzR2xH?=
 =?utf-8?B?VElvTnJFQ3dKSWRxb29LclljWHgyT3RwZGx5VEk5a2hDYi9zcjJmbVYyMFh0?=
 =?utf-8?B?bnpnaVN0c3lLdWZMb0xHNGNvdk9UQmlROXl2MzhmWklPT3RBanF3U2EzaGhT?=
 =?utf-8?B?MURHTk9VVkhSaFlQdGdKZndoOHZ2T1VZc1RyVUxKWHk3b2Z6elcrL0FmbmpY?=
 =?utf-8?B?N20xeXFwNFE2b3Vuc3hScjFBYTdRNURiSThJRFRNQzVYbVZtcWpsbFFyZ21n?=
 =?utf-8?B?VG9YU1ZWMVNUQXMxTmhlK0lCVTE1T2lBeXdGN2hhOEtxdG8wU3FuejkyR3NN?=
 =?utf-8?B?THRYa2VhSGU0N2w1REk4cU92N2FOWmNiUHhhcy9ML0hxU1gyUGJUdlNIa3Na?=
 =?utf-8?B?MXlmb2ZtaEZSczB4MDdHUmIwMmVyYkJ0MjNMbldkbW9Db1JrTGl0aDBHK00y?=
 =?utf-8?B?bU56b0FHV01vN05CbnBZeFMvMVlQZFNjS01wT2UxSGhvODVTWVE5UnMralE5?=
 =?utf-8?B?WHk3RlRsWGpjWWtMMmJOMHQ1eFhNakRhaDdld0VPRlJwaGgvQzVuSERQbVZv?=
 =?utf-8?B?TXhLS0NtdmVRZXRqZjVyelpPcEdtUk1NSytFZkdzQWJTM3ZlTWF5RTN5ckVZ?=
 =?utf-8?B?QkN4d0xsMUF4YjhtQ21EME42SWp0cERsRDVMTWhBV1VueTBWcXNITWcrUWVP?=
 =?utf-8?B?RVRCZWQ5Q3NBQm5BUWJJcnc3c1gwWHU0amtzRTNtWmZYSTBrdm4zK251SjJq?=
 =?utf-8?B?cVVMdlFzMXg1WXQ0UHlvWUlzamNyTk5rNHVwa0s3d2ltc0lhY25TMXo1OFRC?=
 =?utf-8?B?N1EyVFVOV2FEbkVHY2ZTNWM3NE9lUjVTVkxpVW80VTh6TnJsNHFESmJmNmIr?=
 =?utf-8?B?ZkN1STNVeHF1SFVseWxkTUhVdzVIK3M3eUZVZ0tjWFBuZjJycGIvVk1HcUE0?=
 =?utf-8?B?ZkFiSlk5Sk42WEwwajRCVTB2cHRqQU5Lam0xakJIZ2pZVFdvTVY3S3R4SHhx?=
 =?utf-8?B?YlJGbGFYWkVTdlNTOGU5WUlZaHZyK3M2aTl4aU5OcnI2MVhDVWR0K1c4eVFm?=
 =?utf-8?B?RDR4VSt4RVl3UUl5YXlUN203c1d5YTVBY21meEhxQjFjUnIzTTNZK3ZzU1ZH?=
 =?utf-8?B?eWZod3dwemxDZllZMGJiMWN0VCtFUEcvOUovbGJ0ZElRNm4wbUdwL2FMdUZF?=
 =?utf-8?B?R04zRFA5azRpdHZLSGF2MHNPL3Z3VzN2eitZbm42cXVQanFVZnZ4WDJjcUYv?=
 =?utf-8?B?RnFjdFpKaVozUXlBbkNoeXlBUE45RUlkdlVvc1BzeEFPUUVLUjFCeHdQM2cy?=
 =?utf-8?B?MFBsTUNPdnJaZHNDVENkWDA0cG5GSzB1c1VIWFpiRDdUUzRhMU1EdFREdkR3?=
 =?utf-8?B?N1YrRFI1UFZVV3dtcURpUHRIalgwaUR0L0FBN0V0QkZzUGhZRm1iczduKzND?=
 =?utf-8?B?UForSmVPN1djL2RETmIxOEF4NjRuaFhFRVM4aGkwYW16NWdBRnpUcVc2bG1z?=
 =?utf-8?B?YUpZVjB6bjl2MndocHdya28yWElySStnOVk0cGpmRUFWSDJYbkJWOWcvMUMx?=
 =?utf-8?Q?u1LONeMm8z4xqmHXYUtjpxVJn7Up6DCZGLwSL?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d81a565b-e390-40d3-f553-08da2834ace8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 09:59:54.3835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2SPnO3Siy43WGaBzc1LfLUZdMukPchuDWctExTdjg9pjyIbFNpEjMOu4vMkc6uGfJUDtdPcMmIFq/99lTsVwl+gVQRQvl1ajdB3mxPGyvRZrvgF7Ld33HANfdGJGjRab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8942
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 10:00:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2879

Hi Michael,

On 4/27/22 11:34, Michael Opdenacker via lists.yoctoproject.org wrote:
> Greetings,
> 
> In https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_brief-2Dyoctoprojectqs_index.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=I0aiuJJTct1SDB_0N89D6xAIxno9IDPyMeI3dhnbF9v4zDEMeK9uUCv3-sR7N9oB&s=Iu7yw2VPisaC_25nQTj_glXbledzMo8_Mc8ek--miks&e= , we
> suggest to use:
> 
> SSTATE_MIRRORS ?= "file://.* https://urldefense.proofpoint.com/v2/url?u=https-3A__sstate.yoctoproject.org_4.0.999_PATH-3Bdownloadfilename-3DPATH&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=I0aiuJJTct1SDB_0N89D6xAIxno9IDPyMeI3dhnbF9v4zDEMeK9uUCv3-sR7N9oB&s=CmYf2gQjYpJvBW3gs6yY_DCrZoFCMw0CgOVkyWIChu8&e= "
> 
> However, https://urldefense.proofpoint.com/v2/url?u=https-3A__sstate.yoctoproject.org_4.0.999_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=I0aiuJJTct1SDB_0N89D6xAIxno9IDPyMeI3dhnbF9v4zDEMeK9uUCv3-sR7N9oB&s=XBO9beJxxsKb69CRj38-OHCYV5aFixLdie0ruVYc1vo&e=  doesn't seem to exist.
> Could we create it?
> 

Sorry for the botched HTML links, Microsoft O365 just rewrites them 
before the mail lands in my inbox....

4.0.999 represents the kirkstone branch. It is what's between 4.0 and 
4.0.1 tags.

I personally do not want to use 4.0.1 until it is released otherwise it 
may confuse user as to what's actually released and "usable".

I don't know what the sstate cache URL should be for the current 
kirkstone branch (or any branch that is not a tag) though as I don't see 
kirkstone or 4.0.1 subpaths... Could it be that we put sstate-cache of 
kirkstone branch in 4.0 until we have a 4.0.1 tag? Not sure how to 
explain it, but I guess the autobuilder will just put the sstate-cache 
of the current state of the release branch in the last release tag 
sstate-cache directory?

As a side note, the current default docs being the kirkstone (4.0.999) 
branch is something I deem temporary. The issue is that the migration 
manuals and release notes of kirkstone 4.0 *tag* are not up-to-date. The 
ones in kirkstone branch are up-to-date.

I need to write something on the wiki to explain the issue and 
requirements so we can work on fixing this sooner than later.

Cheers,
Quentin

