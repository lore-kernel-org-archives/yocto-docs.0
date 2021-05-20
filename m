Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.2289.1621473204434081320
 for <docs@lists.yoctoproject.org>;
 Wed, 19 May 2021 18:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=U6oqVEOw;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=077456f0b7=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14K19klK011399;
	Thu, 20 May 2021 01:13:16 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com with ESMTP id 38n9cs858k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 May 2021 01:13:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcZgE+D3Fb9DdAgWZP5U062e7DNryvG3EHP61ZL/7q0e9cw0V6iUg3KNUHvNdsfIFBxLc1P7vU9ifJVD0PYRqgjJJBHCUkHuFqUN4XBktYg8zlgsakUHc7g1xzwWJsNhDO2cHdmFwKBlGzn/DFWOVBU95rQ7Hw3WFNinnJOCsrJnArFF/SyhhSrAEL1rRtOBvgp12zR9l28vy6nl0wffNQdAA1KGmCnd/hkqL0QeJXqa4ZXWQSM56qOW1jWoEFW/jdzboKcHUVqtF7pLEUcduHLyDh4X3+AkiE7r2WD9SwS7My1VLTeQrKH1SrvI+sA+63fdEnUl1zMFV+tdu8eWzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAszTj3EuHyTr4w8sAGjfRjO4a2AgZneL1CnLs7bUUI=;
 b=JljyJUlkTNSW4Ri9Ggz1aRqAGkHhuKgPftXVlXgJTzE6KnCUcsqt9YAMAzBiPVtZAlYKMYg+iq1YrXWJAcG1mQxwU2qxdZ/628zZzdYOdiNBfw45s1DvNKpLOdzV2PmpIBXKOLw6pJCwRGSs+I2ib7CquiT0myBQi4xa6otUnlRBtvzOQ5s4U1Skr1jksv2gWeEuPv3ibE+LF0dZUcnJV8TwbtRyY+Ek9NiPJTs24RUgCaP0UNPAEJbj4jWnmxsJHsetj8kwwySZqDQSO8xy16tAM3HaCzeQpYGjb9NOJxDmXwD48KzsHOMXHFgg3WXtcQhrPI1/Rob3P2ZMUTmM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAszTj3EuHyTr4w8sAGjfRjO4a2AgZneL1CnLs7bUUI=;
 b=U6oqVEOwTW/ZeaVs4VLRITXdLlYDyKDYDadcHX0K03lScZNkhGTbxUjI6QbBw6+XksGZ8G5rutQvOAgA5NA++cMNGGf+JO8iVFvbb+cI91um41SWisRi/FoFsb40PknYt2vaj7M6tevfjKBmZUFdMXZ+RcGpxJqtq53TR+CiuaQ=
Authentication-Results: streamunlimited.com; dkim=none (message not signed)
 header.d=none;streamunlimited.com; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1484.namprd11.prod.outlook.com (2603:10b6:4:8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Thu, 20 May 2021 01:13:13 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5%7]) with mapi id 15.20.4129.032; Thu, 20 May 2021
 01:13:13 +0000
Subject: Re: [docs] [yocto-docs][PATCH v2] ref-manual: added new section library-functions
To: Milan Shah <mshah@mvista.com>, docs@lists.yoctoproject.org,
        michael.opdenacker@bootlin.com
Cc: richard.purdie@linuxfoundation.org, srifenbark@gmail.com,
        bluelightning@bluelightning.org, nicolas.dechesne@linaro.org,
        quentin.schulz@streamunlimited.com
References: <1615787270-17662-1-git-send-email-mshah@mvista.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <f81a94d1-9903-0799-862c-de5ea0b5da73@windriver.com>
Date: Wed, 19 May 2021 21:13:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <1615787270-17662-1-git-send-email-mshah@mvista.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.3] (198.48.226.187) by BY3PR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:39b::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.11 via Frontend Transport; Thu, 20 May 2021 01:13:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be1554dc-522d-4d92-568a-08d91b2c708e
X-MS-TrafficTypeDiagnostic: DM5PR11MB1484:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1484AD0AC16C4182F4AEA207F82A9@DM5PR11MB1484.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ylayrMyT1LYOtL4f9lbHsbR/edsrR+qZjYuQUFb16o8+nfQzNVzfrHeiY4mVr2ZAE44SU2OUwInU96lArjPYweH4Hkky1wgzHCNW6voIop9O+tJjz1/o/N22g12MXzQGC2hX2CdEz+eJc5kk6trwQRFJDhsAg91ZJfbVo47r7hNxIlWLU/chhBPQa+JTBa04y6FzX57KOfyKOUernXr1G1w638sIeD97ckKf5TFv7UBpU9SxXrexhJH4oeO/yzQWLbhT8V0MtSFXyMzH8/nkTF7auf3gl/VDDZd5GICfuxRztXf3iQmkzAVsoI5V0Fsh2E6QzZIP6hgpeAwLRd/kr2KtCPZib5eFjsmmds/2il0Y3CwuP1LvPaO5oQPQ3sEaCpjUMWD1UvET8c7Lf3MOKi15aP/ayexILRfq82QeptxJNPsJOSht+Kw/+1CotK0awnTI4WOVmPOTLnYmKd7uQD9TPdGwES4ErZ4mW6Cfu8nQavVtMRIVV5BKUo0pZN4RU4ws4+9XuEM9/fjzU9zQF3uImjUyzqlAGMdDz4X5mD3ZCotQKnhenPwo8fpdUoDfRaHJzHfIUm6g7iDTKWzYSYxCx0hFqKuML/j6jV88z7WOYqGUsOcLFZnrsr7Z/FHz0krn9TKLzdtxFtrnvrRcL/rUA0PIEHCruzgMoVxkdQJeSmGc+FJE//EsIApRoqvd6tgWs+JrwLBZ9w3Pt1nkmf1lhUZF5ZNmjlZHG1Iz4sGS7Br+8mJluCGofJb+Xo5vOALpWQqp8eEDKntS81mVhPhC0HmYmpmYWZLzb+LfNjo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39850400004)(366004)(376002)(6666004)(26005)(8936002)(36756003)(53546011)(2616005)(956004)(478600001)(8676002)(30864003)(2906002)(4326008)(6486002)(966005)(52116002)(5660300002)(83380400001)(31686004)(16526019)(66556008)(86362001)(66476007)(66946007)(38350700002)(316002)(38100700002)(186003)(31696002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZW9KY0p5UEJLQ0xmYk5UL3lzRkNzY2dNVFBOR0Q1UFAzMXZLOGEvT3kzUTFC?=
 =?utf-8?B?U0NpUmE4Njg4RE5xZVpMNG94akgrZUhLK2Vud2tGdGdLM2ErZWF1Ykkwd3Vu?=
 =?utf-8?B?dmJuVDZYNWE3QzNXZ3dNK2V0dVpabllweWg4VWVtWUQyTVBiNVQ2bnNVSk9H?=
 =?utf-8?B?bFZvTG4vSU5QYVViVHRUSXU2Mi92YzkyMVhOUnFTU1R6a3FuV0Uwa212MFlC?=
 =?utf-8?B?Yk8zUGU5SWk4aW9ScFVHZ1NDMTYvay9ZeTc5TmJPaEpEcTdyRTJNeGZFRVJS?=
 =?utf-8?B?V2t0SEFOMDRpSTg5dGdFVFhITWZvUlF1aGIrYmNDWkQwdnlDQkRaTDdxWUtS?=
 =?utf-8?B?Ni9tMXgzVFZLVXJINkpzVHRBUUVtV0VSS1owYVV1RHBGQll6VTZSSVh0Mktz?=
 =?utf-8?B?UzJ0OEVXUko5K2pNTUdOb2ovcll6bzVZVUdpRk1mSERMaE1yT00yUjlHMi9C?=
 =?utf-8?B?cDhjU2hYc3VKMmdJUjNxa3dYSnlLbXV3VHp2UGlldWFCMTFkWmtIWHk2bHlp?=
 =?utf-8?B?SFdvQTRDNk5wdVRqSkF4aHh1RWxvMVVLcm04NDlaY25XZUtvL0xxWERWZG1i?=
 =?utf-8?B?dzhreEZNOUlHaDN5Mzk0OGtPVmJXTjlzamtzaVA0blR6OWVwVEhHQTR4anhs?=
 =?utf-8?B?ak1TcGNPc2ZsaWdDbENxMFVFU09aaFh5OTE1S3J4cGh4MURKZWk3elpPakZm?=
 =?utf-8?B?YXJHcS9hcWZNa2ljZTByZVh3WDVwLy9aQm8wOGUvYzl6MFo5QUNPUEtLb2tY?=
 =?utf-8?B?bW40dWJpTmxZeEZlVzdLeU9XTUtNeGR4SzZqNUFDRHVDRWhWNEpYNUFKTnRo?=
 =?utf-8?B?VXQ3ZHF1aXJnbWc3Q2NOcHExY1FZUm9hN3FFRmsyc0w3RkNOTG1MNkxhYnpt?=
 =?utf-8?B?S2FQendRYVVzM2RtUzh6Z1poeGhXVmtCOTVrcXN2d3lXN2FEQ1Q0WDFZUm9E?=
 =?utf-8?B?bm9FY1AyUGNGQ04xN0RDcXpwQTVYRFF2Zk9FclJOWVJsRy8yZVN2YjRHZm9B?=
 =?utf-8?B?Z2xmdkQwSzB4bDFKK0dRWHVwdHZmS2RZNjJNdkJaK2MyVWdtMHZwNmpNbzRM?=
 =?utf-8?B?ZE5OLzJkeXR3NURJMnBHQ2FDWlh2bC9DWE1BbWV0VFdZNktnb04yby9hd3Ba?=
 =?utf-8?B?Qm8yNVNUNUV4LzZUY0ZmcWlhRG9oa2xxdlBwOVFXQnhRclpsWGZ6bjZHN0Y4?=
 =?utf-8?B?Q3IvQ1NJclpDelZsME81VjdpWFBsMFRVMlJvNGFZOFBiZVZSRVFJb2VyYjFO?=
 =?utf-8?B?SFlmcGZnN1BBMUk2RkJiZXV6TUJ2MEVZdmpsWDBkdndOQmhOdklaYjBvaCtQ?=
 =?utf-8?B?Qmh3RWtnTTFSR01NMU9TbGlNWllOUmJOUnFhZ1BSNTdvV0F6VFpiaytobGhk?=
 =?utf-8?B?aW9WVFd1VDhXUXFuWTlMZjhSelZCL3dJbW9GNGpGK1FUUlhmbGpRM2J4Z09H?=
 =?utf-8?B?TnRFRGZQQkZuWmJNUHZGdTYxR1FmUkFMeXBiK2R4TWVXVVVjeGxicmRXT2lk?=
 =?utf-8?B?ZC9OVjFPV29GaEo0c2ZmOG9vOGRQWDFHTGJTVEFvdklhRm9nT05rMGhSU2Q3?=
 =?utf-8?B?TitUZlVlR3l1eHA0d1ZYV2taaDFGNDdCTThVL3J2MVAxUmZJUFhDT0hhT3Vx?=
 =?utf-8?B?M1RNS3NmSGsxRmo5VGN2T0FKR2pmUVl4SHU5U3FzVUNjL0dRVlVScHAxaHV6?=
 =?utf-8?B?UWNFYjBMTHYzT3FzT0d0QWs4SWFkMjltSnk1YnZ4NXh1TU9HbHVaaTU3cUN1?=
 =?utf-8?Q?ZkruusuHGmxVt54pTR7rMht7rEUI+Ehu5HHmn/R?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1554dc-522d-4d92-568a-08d91b2c708e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 01:13:13.3501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYnw4JWHkXaWztR9lhCQauk+dXLRdZIJ0culBeaOO+/ViphTGM9GqsoppTsCIhIIxrt+UOMlP+cxxuqNc1dOzQ9rTOOvGLc87cWIM26Gxz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1484
X-Proofpoint-ORIG-GUID: 66nXjiwpvFRp-o8QRmRBtinCDzEMPgx0
X-Proofpoint-GUID: 66nXjiwpvFRp-o8QRmRBtinCDzEMPgx0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-19_10:2021-05-19,2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200003
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

Add: michael.opdenacker@bootlin.com

and ping since Milan asked about this in:
   https://bugzilla.yoctoproject.org/show_bug.cgi?id=9612
../Randy


On 2021-03-15 1:47 a.m., Milan Shah wrote:
> Added a new "library functions" section to the manual in the reference manual
> in the yocto-docs repository and document the utils functions to start with.
> 
> See Yocto Bug [#9612] for the details.
> 
> Signed-off-by: Milan Shah <mshah@mvista.com>
> ---
>   documentation/ref-manual/index.rst             |   1 +
>   documentation/ref-manual/library-functions.rst | 467 +++++++++++++++++++++++++
>   2 files changed, 468 insertions(+)
>   create mode 100644 documentation/ref-manual/library-functions.rst
> 
> diff --git a/documentation/ref-manual/index.rst b/documentation/ref-manual/index.rst
> index deb0383..e351142 100644
> --- a/documentation/ref-manual/index.rst
> +++ b/documentation/ref-manual/index.rst
> @@ -17,6 +17,7 @@ Yocto Project Reference Manual
>      structure
>      classes
>      tasks
> +   library-functions
>      devtool-reference
>      kickstart
>      qa-checks
> diff --git a/documentation/ref-manual/library-functions.rst b/documentation/ref-manual/library-functions.rst
> new file mode 100644
> index 0000000..55c8339
> --- /dev/null
> +++ b/documentation/ref-manual/library-functions.rst
> @@ -0,0 +1,467 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +*****************
> +Library Functions
> +*****************
> +
> +utils functions
> +===============
> +
> +The Bitbake Utility Functions ``utils.py`` provides some useful python
> +functions that are typically used in ``meta/classes/utils.bbclass``.
> +
> +See :ref:`ref-manual/migration-1.6:Python Definition substitutions` for the
> +reference of some python definitions.
> +
> +``approved_variables``
> +----------------------
> +
> +Determine and return the list of whitelisted variables which are approved to
> +remain in the environment.
> +
> +``better_compile``
> +------------------
> +
> +A better compile method. This method will print the offending lines.
> +
> +``better_exec``
> +---------------
> +
> +Similiar to ``better_compile``, ``better_exec`` will print the lines that are
> +responsible for the error.
> +
> +``break_hardlinks``
> +-------------------
> +
> +Ensures ``src`` is the only hardlink to this file.  Other hardlinks, if any,
> +are not affected (other than in their st_nlink value, of course).
> +
> +Returns `true` on success and `false` on failure.
> +
> +``build_environment``
> +---------------------
> +
> +Build an environment from all exported variables.
> +
> +``clean_environment``
> +---------------------
> +
> +Clean up any spurious environment variables. This will remove any variables
> +the user has not chosen to preserve.
> +
> +``contains``
> +------------
> +
> +Check if a variable contains all the values specified.
> +
> +::
> +
> +    Arguments:
> +
> +        `variable` -- the variable name. This will be fetched and expanded
> +        (using d.getVar(variable)) and then split into a set.
> +
> +        `checkvalues` -- if this is a string it is split on whitespace into a
> +        set, otherwise coerced directly into a set.
> +
> +        `truevalue` -- the value to return if checkvalues is a subset of variable.
> +
> +        `falsevalue` -- the value to return if variable is empty or if checkvalues
> +        is not a subset of variable.
> +
> +        `d` -- the data store.
> +
> +See the occurrence in :term:`TUNE_ASARGS`, :term:`TUNE_LDARGS`,
> +:ref:`image_types.bbclass <ref-classes-image_types>`, and
> +:ref:`migration-1.8-bluez` sections.
> +
> +``contains_any``
> +----------------
> +
> +Check if a variable contains any values specified.
> +
> +::
> +
> +    Arguments:
> +
> +        `variable` -- the variable name. This will be fetched and expanded
> +        (using d.getVar(variable)) and then split into a set.
> +
> +        `checkvalues` -- if this is a string it is split on whitespace into a
> +        set, otherwise coerced directly into a set.
> +
> +        `truevalue` -- the value to return if checkvalues is a subset of variable.
> +
> +        `falsevalue` -- the value to return if variable is empty or if checkvalues
> +        is not a subset of variable.
> +
> +        `d` -- the data store.
> +
> +See the occurrence in :ref:`image_types.bbclass <ref-classes-image_types>`
> +section.
> +
> +``copyfile``
> +------------
> +
> +Copies a file from src to dest, preserving all permissions and attributes;
> +mtime will be preserved even when moving across filesystems.
> +
> +Returns `true` on success and `false` on failure.
> +
> +``edit_bblayers_conf``
> +----------------------
> +
> +Edit ``bblayers.conf``, adding and/or removing layers
> +
> +::
> +
> +    Parameters:
> +
> +        `bblayers_conf` -- path to bblayers.conf file to edit
> +
> +        `add` -- layer path (or list of layer paths) to add; None or empty list
> +        to add nothing
> +
> +        `remove` -- layer path (or list of layer paths) to remove; None or
> +        empty list to remove nothing
> +
> +        `edit_cb` -- optional callback function that will be called after
> +        processing adds/removes once per existing entry.
> +
> +    Returns a tuple:
> +
> +        `notadded` -- list of layers specified to be added but were not
> +        (because they were already in the list)
> +
> +        `notremoved` -- list of layers that were specified to be removed but
> +        were not (because they were not in the list)
> +
> +``edit_metadata``
> +-----------------
> +
> +Edit lines from a recipe or config file and modify one or more specified
> +variable values set in the file using a specified callback function.
> +Lines are expected to have trailing newlines.
> +
> +::
> +
> +    Parameters:
> +
> +        `meta_lines` -- lines from the file; can be a list or an iterable
> +        (e.g. file pointer)
> +
> +        `variables` -- a list of variable names to look for.
> +        Functions may also be specified, but must be specified with '()'
> +        at the end of the name. Note that the function does not have any intrinsic
> +        understanding of _append, _prepend, _remove, or overrides,
> +        so these are considered as part of the name. These values go into
> +        a regular expression, so regular expression syntax is allowed.
> +
> +        `varfunc` -- callback function called for every variable matching
> +        one of the entries in the variables parameter.
> +
> +            The function should take four arguments:
> +
> +                `varname` -- name of variable matched
> +
> +                `origvalue` -- current value in file
> +
> +                `op` -- the operator (e.g. '+-')
> +
> +                `newlines` --  list of lines up to this point.
> +                You can use this to prepend lines before this variable setting
> +                if you wish.
> +
> +            and should return a four-element tuple:
> +
> +                `newvalue` -- new value to substitute in, or None to drop the
> +                variable setting entirely. (If the removal results in two
> +                consecutive blank lines, one of the blank lines will also
> +                dropped).
> +
> +                `newop` -- the operator to use - if you specify None here,
> +                the original operation will be used.
> +
> +                `indent` -- number of spaces to indent multi-line entries,
> +                or -1 to indent up to the level of the assignment and opening
> +                quote, or a string to use as the indent.
> +
> +                `minbreak` -- True to allow the first element of a multi-line
> +                value to continue on the same line as the assignment,
> +                False to indent before the first element.
> +
> +        To clarify, if you wish not to change the value, then you would return
> +        like this: return origvalue, None, 0, True
> +        match_overrides: True to match items with _overrides on the end,
> +        False otherwise
> +
> +    Returns a tuple:
> +
> +        `updated`:
> +            True if changes were made, False otherwise.
> +        `newlines`:
> +            Lines after processing
> +
> +``edit_metadata_file``
> +----------------------
> +
> +Edit a recipe or config file and modify one or more specified variable values
> +set in the file using a specified callback function. The file is only written
> +to if the value(s) actually change.
> +This is basically the file version of ``edit_metadata``, see that function's
> +description for parameter/usage information.
> +
> +Returns `True` if the file was written to, `False` otherwise.
> +
> +``empty_environment``
> +---------------------
> +
> +Remove all variables from the environment.
> +
> +``exec_flat_python_func``
> +-------------------------
> +
> +Execute a flat python function (defined with def funcname(args):...)
> +
> +``explode_deps``
> +----------------
> +
> +Take an RDEPENDS style string of format:
> +::
> +
> +    "DEPEND1 (optional version) DEPEND2 (optional version) ..."
> +
> +and return a list of dependencies. Version information is ignored.
> +
> +``explode_dep_versions``
> +------------------------
> +
> +Take an RDEPENDS style string of format:
> +::
> +
> +    "DEPEND1 (optional version) DEPEND2 (optional version) ..."
> +
> +skip null value and items appeared in dependancy string multiple times and
> +return a dictionary of dependencies and versions.
> +
> +``explode_dep_versions2``
> +-------------------------
> +
> +Take an RDEPENDS style string of format:
> +::
> +
> +    "DEPEND1 (optional version) DEPEND2 (optional version) ..."
> +
> +and return a dictionary of dependencies and versions.
> +
> +``export_proxies``
> +------------------
> +
> +export common proxies variables from datastore to environment.
> +
> +``fileslocked``
> +---------------
> +
> +Context manager for locking and unlocking file locks.
> +
> +``filter``
> +----------
> +
> +Return all words in the variable that are present in the checkvalues.
> +
> +::
> +
> +    Arguments:
> +
> +        `variable` -- the variable name. This will be fetched and expanded
> +        (using d.getVar(variable)) and then split into a set.
> +
> +        `checkvalues` -- if this is a string it is split on whitespace into a
> +        set, otherwise coerced directly into a set.
> +
> +        `d` -- the data store.
> +
> +``filter_environment``
> +----------------------
> +
> +Create a pristine environment for Bitbake. This will remove variables that are
> +not known and may influence the build in a negative way.
> +
> +``get_file_layer``
> +------------------
> +
> +Determine the collection (as defined by a layer's ``layer.conf`` file)
> +containing the specified file.
> +
> +``get_referenced_vars``
> +-----------------------
> +
> +Return names of vars referenced in `start_expr` (recursively),
> +in quasi-BFS order (variables within the same level are ordered arbitrarily)
> +
> +``is_semver``
> +-------------
> +
> +Is the version string following the semver semantic?
> +
> +    https://semver.org/spec/v2.0.0.html
> +
> +``join_deps``
> +-------------
> +
> +Take the result from ``explode_dep_versions`` and generate a dependency string.
> +
> +``lockfile``
> +------------
> +
> +Use the specified file as a lock file, return when the lock has been acquired.
> +Returns a variable to pass to ``unlockfile``.
> +
> +::
> +
> +    Parameters:
> +
> +        `retry`: `True` to re-try locking if it fails, `False` otherwise
> +
> +        `block`: `True` to block until the lock succeeds, `False` otherwise
> +
> +The `retry` and `block` parameters are kind of equivalent unless you consider
> +the possibility of sending a signal to the process to breakout - at which point
> +you want block-True rather than retry-True.
> +
> +``md5_file``
> +------------
> +
> +Return the hex string representation of the MD5 checksum of filename.
> +
> +``mkdirhier``
> +-------------
> +
> +Create a directory like 'mkdir -p', but does not complain if directory already
> +exists like os.makedirs
> +
> +``movefile``
> +------------
> +
> +Moves a file from ``src`` to `dest`, preserving all permissions and attributes;
> +``mtime`` will be preserved even when moving across filesystems.
> +
> +Returns `true` on success and `false` on failure. Move is atomic.
> +
> +``preserved_envvars``
> +---------------------
> +
> +Variables which are taken from the environment and placed in the metadata.
> +
> +``preserved_envvars_exported``
> +------------------------------
> +
> +Variables which are taken from the environment and placed in and exported from
> +the metadata.
> +
> +``prunedir``
> +------------
> +
> +Delete everything reachable from the directory named in `'topdir'`.
> +
> +``prune_suffix``
> +----------------
> +
> +See if var ends with any of the suffixes listed and remove it if found .
> +
> +``remove``
> +----------
> +
> +Equivalent to rm -f ``xx`` or rm -rf ``xx``.
> +
> +``sha1_file``
> +-------------
> +
> +Return the hex string representation of the SHA1 checksum of the filename.
> +
> +``sha256_file``
> +---------------
> +
> +Return the hex string representation of the 256-bit SHA checksum of filename.
> +
> +``sha384_file``
> +---------------
> +
> +Return the hex string representation of the SHA384 checksum of the filename.
> +
> +``sha512_file``
> +---------------
> +
> +Return the hex string representation of the SHA512 checksum of the filename.
> +
> +``signal_on_parent_exit``
> +-------------------------
> +
> +Trigger signame to be sent when the parent process dies.
> +
> +``split_version``
> +-----------------
> +
> +Split a version string into its constituent parts
> +(:term:`PE`, :term:`PV`, :term:`PR`).
> +
> +``to_boolean``
> +--------------
> +
> +Check input string and return boolean value True/False/None depending upon the
> +checks.
> +
> +``umask``
> +---------
> +
> +Context manager to set the umask to a specific mask, and restore it afterwards.
> +
> +``unlockfile``
> +--------------
> +
> +Unlock a file locked using ``lockfile``.
> +
> +``vercmp_string``
> +-----------------
> +
> +Split version strings and compare them.
> +
> +``vercmp_string_op``
> +--------------------
> +
> +Compare two versions and check if the specified comparison operator matches
> +the result of the comparison. This function is fairly liberal about what
> +operators it will accept since there are a variety of styles depending on
> +the context.
> +
> +``VersionStringException``
> +--------------------------
> +
> +Exception raised when an invalid version specification is found.
> +
> +``which``
> +---------
> +
> +Locate `item` in the list of paths `path` (colon separated string like $PATH).
> +If `direction` is non-zero then the list is reversed.
> +If `history` is True then the list of candidates also returned as result,
> +history.
> +If `executable` is True then the candidate has to be an executable file,
> +otherwise the candidate simply has to exist.
> +
> +``_check_unsafe_delete_path``
> +-----------------------------
> +
> +Basic safeguard against recursively deleting something we should not.
> +If it returns True, the caller should raise an exception with
> +an appropriate message.
> +
> +.. note::
> +
> +    This is NOT meant to be a security mechanism -
> +    just a guard against silly mistakes with potentially disastrous results.
> +
> +``_print_trace``
> +----------------
> +
> +Print the Environment of a Text Body.
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
